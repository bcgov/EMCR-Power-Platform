using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using MQTTnet;
using MQTTnet.Extensions.TopicTemplate;
using MQTTnet.Formatter;
using MQTTnet.Packets;
using MQTTnet.Protocol;

using System.Text.Json;

namespace EEWWebApiApp.Services
{
    public class NrCanMqttBackGroundService : BackgroundService
    {
        private readonly IMqttClient _mqttClient;
        private readonly MqttClientFactory _mqttFactory = new MqttClientFactory();
        private static readonly MqttClientOptions _mqttClientOptions = new MqttClientOptionsBuilder().WithTcpServer("localhost").Build();
        static readonly MqttTopicTemplate sampleTemplate = new("mqttnet/samples/topic/{id}");

        public NrCanMqttBackGroundService()
        {
            _mqttClient = _mqttFactory.CreateMqttClient();
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            await ConnectToNrCan();

            while (!stoppingToken.IsCancellationRequested)
            {
                await Task.Delay(1000, stoppingToken);
            }

        }

        public async Task ConnectToNrCan()
        {
            /*
             * This sample shows how to reconnect when the connection was dropped.
             * This approach uses a custom Task/Thread which will monitor the connection status.
             * This is the recommended way but requires more custom code!
             */

            

            await Task.Run(
                async () =>
                {
                    // User proper cancellation and no while(true).
                    while (true)
                    {
                        bool isSubscribed = false;

                        try
                        {
                            // Setup message handling before connecting so that queued messages
                            // are also handled properly. When there is no event handler attached all
                            // received messages get lost.
                            _mqttClient.ApplicationMessageReceivedAsync += e =>
                            {
                                Console.WriteLine("Received application message.");
                                Console.WriteLine(e.ApplicationMessage?.Topic);

                                return Task.CompletedTask;
                            };

                            // This code will also do the very first connect! So no call to _ConnectAsync_ is required in the first place.
                            if (!await _mqttClient.TryPingAsync())
                            {
                                await _mqttClient.ConnectAsync(_mqttClientOptions, CancellationToken.None);

                                // Subscribe to topics when session is clean etc.
                                Console.WriteLine("The MQTT client is connected.");

                                if (!isSubscribed)
                                {
                                    var mqttSubscribeOptions = _mqttFactory.CreateSubscribeOptionsBuilder().WithTopicTemplate(sampleTemplate.WithParameter("id", "1")).Build();

                                    var response = await _mqttClient.SubscribeAsync(mqttSubscribeOptions, CancellationToken.None);

                                    Console.WriteLine("MQTT client subscribed to topic.");

                                    var jsonResponse = JsonSerializer.Serialize(response);
                                    Console.WriteLine(jsonResponse);

                                    isSubscribed = true;
                                }
                            }
                        }
                        catch
                        {
                            // Handle the exception properly (logging etc.).
                        }
                        finally
                        {
                            // Check the connection state every 5 seconds and perform a reconnect if required.
                            await Task.Delay(TimeSpan.FromSeconds(5));
                        }
                    }
                });
        }

        public async Task ListTopics()
        {
            /*
             * This sample shows how to list all topics that are currently subscribed.
             */
            await _mqttClient.ConnectAsync(_mqttClientOptions, CancellationToken.None);

            // Subscribe to topics when session is clean etc.
            Console.WriteLine("The MQTT client is connected.");
            _mqttClient.ConnectedAsync += async e =>
            {
                Console.WriteLine("Connected to broker.");

                // Subscribe to all topics
                await _mqttClient.SubscribeAsync(new MqttTopicFilterBuilder().WithTopic("#").Build());
                Console.WriteLine("Subscribed to all topics.");
            };

            _mqttClient.ApplicationMessageReceivedAsync += e =>
            {
                var topic = e.ApplicationMessage.Topic;
                Console.WriteLine($"Received message from topic: {topic}");
                return Task.CompletedTask;
            };
        }

        public static async Task Handle_Received_Application_Message()
        {
            /*
             * This sample subscribes to a topic and processes the received message.
             */

            var mqttFactory = new MqttClientFactory();

            using (var mqttClient = mqttFactory.CreateMqttClient())
            {
                var mqttClientOptions = new MqttClientOptionsBuilder().WithTcpServer("test.mosquitto.org").Build();

                // Setup message handling before connecting so that queued messages
                // are also handled properly. When there is no event handler attached all
                // received messages get lost.
                mqttClient.ApplicationMessageReceivedAsync += e =>
                {
                    Console.WriteLine("Received application message.");
                    Console.WriteLine(e.ApplicationMessage?.Topic);

                    return Task.CompletedTask;
                };

                await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

                var mqttSubscribeOptions = mqttFactory.CreateSubscribeOptionsBuilder().WithTopicTemplate(sampleTemplate.WithParameter("id", "2")).Build();

                await mqttClient.SubscribeAsync(mqttSubscribeOptions, CancellationToken.None);

                Console.WriteLine("MQTT client subscribed to topic.");

                Console.WriteLine("Press enter to exit.");
                Console.ReadLine();
            }
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

        public static async Task Subscribe_Topic()
        {
            /*
             * This sample subscribes to a topic.
             */

            var mqttFactory = new MqttClientFactory();

            using (var mqttClient = mqttFactory.CreateMqttClient())
            {
                var mqttClientOptions = new MqttClientOptionsBuilder().WithTcpServer("broker.hivemq.com").Build();

                await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);

                var mqttSubscribeOptions = mqttFactory.CreateSubscribeOptionsBuilder().WithTopicTemplate(sampleTemplate.WithParameter("id", "1")).Build();

                var response = await mqttClient.SubscribeAsync(mqttSubscribeOptions, CancellationToken.None);

                Console.WriteLine("MQTT client subscribed to topic.");

                // The response contains additional data sent by the server after subscribing.

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
