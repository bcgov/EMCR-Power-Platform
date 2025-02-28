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

namespace EEWWebApiApp.Services
{
    public class NrCanMqttBackGroundService : BackgroundService
    {
        private readonly IMqttClient _mqttClient;
        private readonly MqttClientFactory _mqttFactory = new MqttClientFactory();
        private static readonly MqttClientOptions _mqttClientOptions = new MqttClientOptionsBuilder().WithTcpServer("test.mosquitto.org").Build();
        static readonly MqttTopicTemplate sampleTemplate = new("mqttnet/samples/topic/{id}");
        private readonly IHostApplicationLifetime _applicationLifetime;
        private readonly object _connectionLock = new object(); // Lock object for synchronization

        public NrCanMqttBackGroundService(IHostApplicationLifetime applicationLifetime)
        {
            _mqttClient = _mqttFactory.CreateMqttClient();
            _applicationLifetime = applicationLifetime;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            try
            {
                // Start the MQTT client and pass the cancellation token
                var connectTask = ConnectToNrCan(stoppingToken);

                // Wait for the connection to be established
                while (!_mqttClient.IsConnected && !stoppingToken.IsCancellationRequested)
                {
                    Console.WriteLine("Waiting for MQTT connection...");
                    await Task.Delay(1000, stoppingToken);
                }

                if (_mqttClient.IsConnected)
                {
                    // Publish a test message
                    await PublishMessageAsync("test/topic", "Hello, MQTT!", stoppingToken);
                }
                else
                {
                    Console.WriteLine("MQTT connection failed.");
                }

                // Wait for the cancellation token to be triggered or handle the graceful stop
                var timeToShutdown = DateTime.Now.Date.AddDays(1);  // set to tomorrow midnight
                while (!stoppingToken.IsCancellationRequested)
                {
                    if (DateTime.Now >= timeToShutdown)
                    {
                        Console.WriteLine("Triggering graceful shutdown at: " + DateTime.Now);

                        // Trigger the graceful shutdown of the application
                        _applicationLifetime.StopApplication();  // Graceful stop

                        return;
                    }

                    // Regular delay to monitor the message queue
                    await Task.Delay(1000, stoppingToken);
                }
            }
            catch (OperationCanceledException)
            {
                // Handle cancellation (e.g., log or cleanup)
                Console.WriteLine("Operation was canceled.");
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
            finally
            {
                // Perform cleanup if needed
                Console.WriteLine("ExecuteAsync has stopped.");
            }
        }


        public async Task ConnectToNrCan(CancellationToken cancellationToken)
        {
            await Task.Run(async () =>
            {
                while (!cancellationToken.IsCancellationRequested)
                {
                    bool isSubscribed = false;

                    try
                    {
                        // Use a lock to ensure only one connection attempt at a time
                        lock (_connectionLock)
                        {

                            // Attach the event handler for incoming messages
                            _mqttClient.ApplicationMessageReceivedAsync += e =>
                                {
                                    Console.WriteLine($"[{DateTime.UtcNow}] Received application message.");
                                    Console.WriteLine($"Topic: {e.ApplicationMessage.Topic}");
                                    Console.WriteLine($"Payload: {Encoding.UTF8.GetString(e.ApplicationMessage.Payload)}");
                                    Console.WriteLine($"QoS: {e.ApplicationMessage.QualityOfServiceLevel}");
                                    Console.WriteLine($"Retain: {e.ApplicationMessage.Retain}");

                                    // Handle specific topics
                                    if (e.ApplicationMessage.Topic == "sensors/temperature")
                                    {
                                        Console.WriteLine("Processing temperature data...");
                                        // Add your logic here
                                    }
                                    else if (e.ApplicationMessage.Topic == "sensors/humidity")
                                    {
                                        Console.WriteLine("Processing humidity data...");
                                        // Add your logic here
                                    }

                                    return Task.CompletedTask;
                                };

                            // Check connection and reconnect if necessary
                            if (!_mqttClient.TryPingAsync().Result)
                            {
                                Console.WriteLine("Ping failed. Attempting to reconnect...");
                                _mqttClient.ConnectAsync(_mqttClientOptions, cancellationToken).Wait(cancellationToken); // Use .Wait to block within the lock
                                Console.WriteLine("The MQTT client is connected.");

                                // Subscribe to all topics using the # wildcard
                                if (!isSubscribed)
                                {
                                    var topicFilter = new MqttTopicFilterBuilder()
                                        .WithTopic("#")
                                        .WithQualityOfServiceLevel(MqttQualityOfServiceLevel.AtLeastOnce)
                                        .Build();

                                    var response = _mqttClient.SubscribeAsync(topicFilter, cancellationToken).Result; // Use .Result to block within the lock
                                    Console.WriteLine("MQTT client subscribed to topic: #");

                                    var jsonResponse = JsonSerializer.Serialize(response);
                                    Console.WriteLine($"Subscription response: {jsonResponse}");

                                    isSubscribed = true;
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Log the exception
                        Console.WriteLine($"An error occurred: {ex.Message}");
                        isSubscribed = false; // Reset subscription flag on error
                    }
                    finally
                    {
                        // Wait for 5 seconds before checking the connection again
                        await Task.Delay(TimeSpan.FromSeconds(5), cancellationToken);
                    }
                }
            }, cancellationToken);
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

        public static async Task Send_Responses()
        {
            /*
             * This sample subscribes to a topic and sends a response to the broker. This requires at least QoS level 1 to work!
             */

            var mqttFactory = new MqttClientFactory();

            using (var mqttClient = mqttFactory.CreateMqttClient())
            {
                mqttClient.ApplicationMessageReceivedAsync += delegate (MqttApplicationMessageReceivedEventArgs args)
                {
                    // Do some work with the message...

                    // Now respond to the broker with a reason code other than success.
                    args.ReasonCode = MqttApplicationMessageReceivedReasonCode.ImplementationSpecificError;
                    args.ResponseReasonString = "That did not work!";

                    // User properties require MQTT v5!
                    args.ResponseUserProperties.Add(new MqttUserProperty("My", "Data"));

                    // Now the broker will resend the message again.
                    return Task.CompletedTask;
                };

                var mqttClientOptions = new MqttClientOptionsBuilder().WithTcpServer("broker.hivemq.com").Build();

                await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

                var mqttSubscribeOptions = mqttFactory.CreateSubscribeOptionsBuilder().WithTopicTemplate(sampleTemplate.WithParameter("id", "1")).Build();

                var response = await mqttClient.SubscribeAsync(mqttSubscribeOptions, CancellationToken.None);

                Console.WriteLine("MQTT client subscribed to topic.");

                var jsonResponse = JsonSerializer.Serialize(response);
                Console.WriteLine(jsonResponse);
            }
        }

        public static async Task Subscribe_Multiple_Topics()
        {
            /*
             * This sample subscribes to several topics in a single request.
             */

            var mqttFactory = new MqttClientFactory();

            using (var mqttClient = mqttFactory.CreateMqttClient())
            {
                var mqttClientOptions = new MqttClientOptionsBuilder().WithTcpServer("broker.hivemq.com").Build();

                await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

                // Create the subscribe options including several topics with different options.
                // It is also possible to all of these topics using a dedicated call of _SubscribeAsync_ per topic.
                var mqttSubscribeOptions = mqttFactory.CreateSubscribeOptionsBuilder()
                    .WithTopicTemplate(sampleTemplate.WithParameter("id", "1"))
                    .WithTopicTemplate(sampleTemplate.WithParameter("id", "2"), noLocal: true)
                    .WithTopicTemplate(sampleTemplate.WithParameter("id", "3"), retainHandling: MqttRetainHandling.SendAtSubscribe)
                    .Build();

                var response = await mqttClient.SubscribeAsync(mqttSubscribeOptions, CancellationToken.None);

                Console.WriteLine("MQTT client subscribed to topics.");

                var jsonResponse = JsonSerializer.Serialize(response);
                Console.WriteLine(jsonResponse);
            }
        }

        static void ConcurrentProcessingDisableAutoAcknowledge(CancellationToken shutdownToken, IMqttClient mqttClient)
        {
            /*
             * This sample shows how to achieve concurrent processing and not have message AutoAcknowledged
             * This to have a proper QoS1 (at-least-once) experience for what at least MQTT specification can provide
             */
            mqttClient.ApplicationMessageReceivedAsync += ea =>
            {
                ea.AutoAcknowledge = false;

                async Task ProcessAsync()
                {
                    // DO YOUR WORK HERE!
                    await Task.Delay(1000, shutdownToken);
                    await ea.AcknowledgeAsync(shutdownToken);
                    // WARNING: If process failures are not transient the message will be retried on every restart of the client
                    //          A failed message will not be dispatched again to the client as MQTT does not have a NACK packet to let
                    //          the broker know processing failed
                    //
                    // Optionally: Use a framework like Polly to create a retry policy: https://github.com/App-vNext/Polly#retry
                }

                _ = Task.Run(ProcessAsync, shutdownToken);

                return Task.CompletedTask;
            };
        }

        static void ConcurrentProcessingWithLimit(CancellationToken shutdownToken, IMqttClient mqttClient)
        {
            /*
             * This sample shows how to achieve concurrent processing, with:
             * - a maximum concurrency limit based on Environment.ProcessorCount
             */

            var concurrent = new SemaphoreSlim(Environment.ProcessorCount);

            mqttClient.ApplicationMessageReceivedAsync += async ea =>
            {
                await concurrent.WaitAsync(shutdownToken).ConfigureAwait(false);

                async Task ProcessAsync()
                {
                    try
                    {
                        // DO YOUR WORK HERE!
                        await Task.Delay(1000, shutdownToken);
                    }
                    finally
                    {
                        concurrent.Release();
                    }
                }

                _ = Task.Run(ProcessAsync, shutdownToken);
            };
        }
    }
}
