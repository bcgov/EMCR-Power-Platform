using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using MQTTnet;
using MQTTnet.Extensions.TopicTemplate;
using MQTTnet.Formatter;
using MQTTnet.Packets;
using MQTTnet.Protocol;
using System.Text.Json;
using Microsoft.Extensions.Hosting.Internal;
using Newtonsoft.Json.Linq;
using Microsoft.Extensions.Configuration;
using System.Runtime.CompilerServices;
using Microsoft.Xrm.Sdk;
using Microsoft.Extensions.Logging;

namespace EEWWebApiApp.Services
{
    public class NrCanMqttBackGroundService : BackgroundService
    {
        private readonly IMqttClient _mqttClient;
        private readonly MqttClientFactory _mqttFactory = new MqttClientFactory();
        private MqttClientOptions _mqttClientOptions;
        static readonly MqttTopicTemplate sampleTemplate = new("mqttnet/samples/topic/{id}");
        private readonly IHostApplicationLifetime _applicationLifetime;
        private readonly object _connectionLock = new object(); // Lock object for synchronization
        private readonly ILogger<NrCanMqttBackGroundService> _logger;
        private readonly CRMHelper _crmHelper;
        private MQTTSettings _mqttSettings = new MQTTSettings();
        private D365Settings _d365Settings = new D365Settings();
        private int _connectionFailureCount = 0;
        private const int MaxConnectionFailures = 3;
        private int _currentBrokerIndex = 0;

        public NrCanMqttBackGroundService(IConfiguration configuration, IHostApplicationLifetime applicationLifetime, ILogger<NrCanMqttBackGroundService> logger)
        {
            _logger = logger;
            _mqttClient = _mqttFactory.CreateMqttClient();
            _applicationLifetime = applicationLifetime;

            _mqttSettings = configuration.GetSection("MQTTSettings")?.Get<MQTTSettings>();
            _d365Settings = configuration.GetSection("D365Settings")?.Get<D365Settings>();
            _crmHelper = new CRMHelper(_d365Settings);
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            try
            {
                var connectTask = ConnectToNrCan(stoppingToken);

                while (!_mqttClient.IsConnected && !stoppingToken.IsCancellationRequested)
                {
                    _logger.LogInformation("Waiting for MQTT connection...");
                    await Task.Delay(1000, stoppingToken);
                }

                if (!_mqttClient.IsConnected)
                {
                    _logger.LogError("MQTT connection failed.");
                }
            }
            catch (OperationCanceledException)
            {
                _logger.LogWarning("Operation was canceled.");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "An error occurred during execution.");
            }
            finally
            {
                _logger.LogInformation("ExecuteAsync has stopped.");
            }
        }

        public async Task ConnectToNrCan(CancellationToken cancellationToken, bool testMode = false)
        {
            await Task.Run(async () =>
            {
                while (!cancellationToken.IsCancellationRequested)
                {
                    bool isSubscribed = false;

                    try
                    {
                        if (testMode)
                        {
                            await UsingStaticSampleData(cancellationToken);
                        }
                        else
                        {
                            ProcessEEWMessages();

                            if (!await _mqttClient.TryPingAsync())
                            {
                                _logger.LogWarning("Ping failed. Attempting to reconnect...");

                                string certificatePath = testMode ? "./data/test.pem" : "./data/partners.pem";

                                // Determine which broker to use
                                if (_connectionFailureCount >= MaxConnectionFailures)
                                {
                                    _currentBrokerIndex = (_currentBrokerIndex + 1) % _mqttSettings.Brokers.Length; ;
                                    _connectionFailureCount = 0;
                                }
                                _mqttClientOptions = new MqttClientOptionsBuilder()
                                    .WithTcpServer(testMode ? "test.mosquitto.org" : _mqttSettings.Brokers[_currentBrokerIndex], _mqttSettings.Port)
                                    .WithCredentials(_mqttSettings.Username, _mqttSettings.Password)
                                    .WithTlsOptions(new MqttClientTlsOptionsBuilder()
                                        .WithTrustChain(LoadCertificatesFromPem(certificatePath)).Build())
                                    .WithProtocolVersion(MqttProtocolVersion.V311)
                                    .Build();

                                var connAck = await _mqttClient.ConnectAsync(_mqttClientOptions, cancellationToken);

                                if (connAck.ResultCode == MqttClientConnectResultCode.Success)
                                {
                                    _logger.LogInformation("The MQTT client is connected.");

                                    _connectionFailureCount = 0; // Reset failure count on successful connection

                                    if (!isSubscribed)
                                    {
                                        isSubscribed = await SubscribeToTopics(isSubscribed, cancellationToken);
                                    }
                                }
                                else
                                {
                                    _logger.LogError("Failed to connect to MQTT broker. Reason: {Reason}", connAck.ResultCode);
                                    _connectionFailureCount++;
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        _logger.LogError(ex, "An error occurred while connecting to MQTT broker.");
                        isSubscribed = false;
                        _connectionFailureCount++;

                        JObject jNRCan = new JObject()
                        {
                            ["detail"] = ex.Message,
                            ["type"] = 717350000
                        };

                        await CreateFailureRecord(jNRCan);
                    }
                    finally
                    {
                        await Task.Delay(TimeSpan.FromSeconds(5), cancellationToken);
                    }
                }
            }, cancellationToken);
        }

        private async Task<bool> SubscribeToTopics(bool isSubscribed, CancellationToken cancellationToken)
        {
            var topics = new List<string>
                {
                    _mqttSettings.GroundMotionPolygonTopic,
                    _mqttSettings.GroundMotionPointsTopic,
                    _mqttSettings.CoreXmlTopic,
                    _mqttSettings.EEWOverallHealth
                };

            var topicFilters = topics.Select(topic =>
                new MqttTopicFilterBuilder().WithTopic(topic).Build()).ToList();

            var responses = new List<MqttClientSubscribeResult>();

            foreach (var topicFilter in topicFilters)
            {
                var response = await _mqttClient.SubscribeAsync(topicFilter, cancellationToken);
                responses.Add(response);

                // Log each subscription attempt
                _logger.LogInformation("Subscribed to MQTT topic: {Topic}, Response: {Response}", topicFilter.Topic, JsonSerializer.Serialize(response));
            }

            // Check if any subscription failed
            bool allSubscribedSuccessfully = responses.All(response =>
                response.Items.All(item =>
                    item.ResultCode == MqttClientSubscribeResultCode.GrantedQoS0 ||
                    item.ResultCode == MqttClientSubscribeResultCode.GrantedQoS1 ||
                    item.ResultCode == MqttClientSubscribeResultCode.GrantedQoS2));

            if (!allSubscribedSuccessfully)
            {
                _logger.LogError("One or more MQTT topic subscriptions failed.");
                return false;
            }

            _logger.LogInformation("Successfully subscribed to all MQTT topics.");
            return true;
        }

        private void ProcessEEWMessages()
        {
            _mqttClient.ApplicationMessageReceivedAsync += async e =>
            {
                JObject jNRCan = new JObject()
                {
                    ["topic"] = e.ApplicationMessage.Topic,
                    ["payload"] = Encoding.UTF8.GetString(e.ApplicationMessage.Payload),
                    ["receivedtime"] = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:ss.fff")
                };

                if (e.ApplicationMessage.Topic == _mqttSettings.EEWOverallHealth && _connectionFailureCount > 0)
                {
                    _logger.LogInformation($"Connection error happened, monitor health of servers.");
                    await CreateNrCanHealthRecord(jNRCan);
                }
                else if (e.ApplicationMessage.Topic != _mqttSettings.EEWOverallHealth)
                {
                    var originalXml = Encoding.UTF8.GetString(e.ApplicationMessage.Payload);
                    if (e.ApplicationMessage.Topic == _mqttSettings.GroundMotionPolygonTopic
                    && (_d365Settings.LoggingLevel == LoggingLevel.Polygon || _d365Settings.LoggingLevel == LoggingLevel.All))
                    {
                        try
                        {
                            //string filePath = "./data/polygon.xml"; // Replace with your XML file path
                            //originalXml = File.ReadAllText(filePath);
                            // Deserialize XML to class
                            var eventMessage = XmlHelper.DeserializeEventMessagePolygon(originalXml);
                            jNRCan["magnitude"] = eventMessage.CoreInfo.Mag.Value;
                            jNRCan["latitude"] = eventMessage.CoreInfo.Lat.Value;
                            jNRCan["longitude"] = eventMessage.CoreInfo.Lon.Value;
                            jNRCan["id"] = eventMessage.CoreInfo.Id;
                            jNRCan["version"] = eventMessage.version;
                            jNRCan["timestamp"] = eventMessage.timestamp;

                            // Serialize class back to XML
                            var serializedXml = XmlHelper.SerializeToXml(eventMessage);
                            // Compare original and serialized XML
                            XmlHelper.CompareXml(originalXml, serializedXml);
                        }
                        catch (Exception ex)
                        {
                            _logger.LogInformation($"Error during XML conversion: {ex.Message}");
                        }
                    }
                    else if (e.ApplicationMessage.Topic == _mqttSettings.GroundMotionPointsTopic
                    && (_d365Settings.LoggingLevel == LoggingLevel.Point || _d365Settings.LoggingLevel == LoggingLevel.All))
                    {
                        try
                        {
                            var eventMessage = XmlHelper.DeserializeEventMessageMap(originalXml);
                            jNRCan["magnitude"] = eventMessage.CoreInfo.Mag.Value;
                            jNRCan["latitude"] = eventMessage.CoreInfo.Lat.Value;
                            jNRCan["longitude"] = eventMessage.CoreInfo.Lon.Value;
                            jNRCan["id"] = eventMessage.CoreInfo.Id;
                            jNRCan["version"] = eventMessage.version;
                            jNRCan["timestamp"] = eventMessage.timestamp;

                            var serializedXml = XmlHelper.SerializeToXml(eventMessage);
                            XmlHelper.CompareXml(originalXml, serializedXml);
                        }
                        catch (Exception ex)
                        {
                            _logger.LogInformation($"Error during XML conversion: {ex.Message}");
                        }
                    }
                    else if (e.ApplicationMessage.Topic == _mqttSettings.CoreXmlTopic
                    && (_d365Settings.LoggingLevel == LoggingLevel.General || _d365Settings.LoggingLevel == LoggingLevel.All
                        || _d365Settings.LoggingLevel == LoggingLevel.Polygon))
                    {
                        try
                        {
                            var eventMessage = XmlHelper.DeserializeEventMessageDm(originalXml);
                            jNRCan["magnitude"] = eventMessage.CoreInfo.Mag.Value;
                            jNRCan["latitude"] = eventMessage.CoreInfo.Lat.Value;
                            jNRCan["longitude"] = eventMessage.CoreInfo.Lon.Value;
                            jNRCan["id"] = eventMessage.CoreInfo.Id;
                            jNRCan["version"] = eventMessage.version;
                            jNRCan["timestamp"] = eventMessage.timestamp;

                            var serializedXml = XmlHelper.SerializeToXml(eventMessage);
                            XmlHelper.CompareXml(originalXml, serializedXml);
                        }
                        catch (Exception ex)
                        {
                            _logger.LogInformation($"Error during XML conversion: {ex.Message}");
                        }
                    };

                    jNRCan["weatherwiresenttime"] = DateTime.UtcNow.AddMilliseconds(500).ToString("yyyy-MM-dd HH:mm:ss.fff");
                    await Task.Delay(500); // Pause the code for 0.5 second
                    await CreateNrCanAlertRecord(jNRCan);
                }
            };
        }

        private async Task UsingStaticSampleData(CancellationToken cancellationToken)
        {
            //Generate fake data
            string dataPath = "./data/sampledata1.xml"; // Path to your PEM file

            //EventMessage myevent = new EventMessage();
            //(decimal latitude, decimal longitude) coordinates = SampleDataGenerator.GenerateRandomBCCoordinate();
            //myevent = SampleDataGenerator.GenerateSampleData(XmlHelper.GetRandomDecimal(), coordinates.latitude, coordinates.longitude);

            //string tmp = XmlHelper.SerializeToXml(myevent);
            //JObject jNRCan = new JObject()
            //{
            //    ["topic"] = "Stone River: " + DateTime.UtcNow.ToString(),
            //    ["payload"] = tmp
            //};

            string pemContent = File.ReadAllText(dataPath);
            JObject jNRCan = new JObject()
            {
                ["topic"] = "Stone River: " + DateTime.UtcNow.ToString(),
                ["payload"] = pemContent
            };

            _ = CreateNrCanAlertRecord(jNRCan);
            await Task.Delay(TimeSpan.FromSeconds(60), cancellationToken);
        }

        private static X509Certificate2Collection LoadCertificatesFromPem(string certPath)
        {
            var caChain = new X509Certificate2Collection();
            var pemData = File.ReadAllText(certPath);

            string pemContent = File.ReadAllText(certPath);

            X509Certificate2Collection certs = new X509Certificate2Collection();
            certs.ImportFromPem(pemContent);
            return certs;
        }

        public async Task CreateNrCanAlertRecord(JObject jNRCan)
        {
            try
            {
                // Fetch existing records to check for duplicates
                var fetchXml = $@"
                <fetch top='1'>
                    <entity name='emcr_alert'>
                        <attribute name='emcr_eventid' />
                        <filter>
                            <condition attribute='emcr_eventid' operator='eq' value='{jNRCan["id"]}' />
                            <condition attribute='emcr_topic' operator='eq' value='{jNRCan["topic"]}' />
                            <condition attribute='emcr_version' operator='eq' value='{jNRCan["version"]}' />
                        </filter>
                    </entity>
                </fetch>";

                var exist = await _crmHelper.FetchRecordsAsync("emcr_alerts", fetchXml);

                if (exist)
                {
                    return;
                }

                var newNRCan = new JObject
                {
                    ["emcr_source"] = 717350000,
                    ["emcr_topic"] = jNRCan["topic"],
                    ["emcr_eventid"] = jNRCan["id"],
                    ["emcr_version"] = jNRCan["version"],
                    ["emcr_latitude"] = decimal.Parse(jNRCan["latitude"]?.ToString()),
                    ["emcr_longitude"] = decimal.Parse(jNRCan["longitude"]?.ToString()),
                    ["emcr_magnitude"] = decimal.Parse(jNRCan["magnitude"]?.ToString()),
                    ["emcr_receivedtime"] = DateTime.Parse(jNRCan["receivedtime"].ToString()),
                    ["emcr_receivedtimeseconds"] = DateTime.TryParse(jNRCan["receivedtime"]?.ToString(),
                        out var receivedTime) ? (receivedTime.Second + (receivedTime.Millisecond / 1000m)) : 0,
                    ["emcr_weatherwiresenttime"] = DateTime.Parse(jNRCan["weatherwiresenttime"]?.ToString()),
                    ["emcr_weatherwiresenttimeseconds"] = DateTime.TryParse(jNRCan["weatherwiresenttime"]?.ToString(),
                        out var weatherTime) ? (weatherTime.Second + (weatherTime.Millisecond / 1000m)) : 0,
                    ["emcr_timestamp"] = DateTime.Parse(jNRCan["timestamp"]?.ToString()),
                    ["emcr_timestampseconds"] = DateTime.TryParse(jNRCan["timestamp"]?.ToString(),
                        out var timestamp) ? (timestamp.Second + (timestamp.Millisecond / 1000m)) : 0,
                    ["emcr_message"] = jNRCan["payload"]
                };

                var result = await _crmHelper.CreateRecordAsync("emcr_alerts", newNRCan);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error: " + ex.Message);
                JObject error = new JObject()
                {
                    ["detail"] = ex.Message,
                    ["type"] = 717350003
                };

                await CreateFailureRecord(error);
            }
        }

        public async Task CreateNrCanHealthRecord(JObject jNRCan)
        {
            try
            {
                var newNRCan = new JObject
                {
                    ["emcr_source"] = 717350000,
                    ["emcr_topic"] = jNRCan["topic"],
                    ["emcr_receivedtime"] = DateTime.Parse(jNRCan["receivedtime"].ToString()),
                    ["emcr_message"] = jNRCan["payload"]
                };

                var result = await _crmHelper.CreateRecordAsync("emcr_alerts", newNRCan);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error: " + ex.Message);
                JObject error = new JObject()
                {
                    ["detail"] = ex.Message,
                    ["type"] = 717350003
                };

                await CreateFailureRecord(error);
            }
        }

        public async Task CreateFailureRecord(JObject jNRCan)
        {
            try
            {
                var newNRCan = new JObject
                {
                    ["emcr_details"] = jNRCan["detail"],
                    ["emcr_eewfailuretype"] = jNRCan["type"]
                };


                var result = await _crmHelper.CreateRecordAsync("emcr_eewfailurelogs", newNRCan);
                //_logger.Log(LogLevel.Information, "Record created successfully: " + result);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }
        }

        public async Task PublishMessageAsync(string topic, string payload, CancellationToken cancellationToken)
        {
            var message = new MqttApplicationMessageBuilder()
                .WithTopic(topic)
                .WithPayload(payload)
                .WithQualityOfServiceLevel(MqttQualityOfServiceLevel.AtLeastOnce)
                .Build();

            await _mqttClient.PublishAsync(message, cancellationToken);
            Console.WriteLine($"Published message to topic: {topic}");
        }


    }
}
