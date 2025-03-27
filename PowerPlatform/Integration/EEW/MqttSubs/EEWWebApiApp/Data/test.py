import time
import paho.mqtt.client as mqtt  # If this fails, do "pip install paho-mqtt"
import ssl

# These two are for logging into the broker with a client certificate.
host = 'eew-qw-test-alert2.eew2.nrcan-rncan.cloud-nuage.canada.ca'
client_certificate_file = "partners.pem"

# These two are for logging into the broker with a username/password
client_username = "emcrbc"
client_password = "+"


# Make some callback functions which set global status variables.
connected = False
subscribed = False
published = False


def on_connect(*args, **kwargs):
    global connected
    print("Connected!")
    connected = True


def on_disconnect(disconnect_client, userdata, rc):
    global connected
    print(f"client disconnected with reason code {rc}")
    connected = False


def on_subscribe(sub_client, userdata, mid, granted_qos):
    global subscribed
    print(f"subscribed with qos={granted_qos}\n")
    subscribed = True


def on_unsubscribe(sub_client, userdata, mid):
    global subscribed
    print("unsubscribed\n")
    subscribed = False


def on_message(message_client, userdata, message):
    print("message received: ", str(message.payload.decode("utf-8")))


def on_publish(pub_client, userdata, mid):
    global published
    print(f"data published mid={mid}\n")
    published = True


if __name__ == "__main__":
    mqtts_client = mqtt.Client(client_id="MQTTS Client ID")
    topic_name = "eew/sys/ha/data"

    # Connect to the MQTT broker using a username/password
    mqtts_client.tls_set(
        ca_certs=client_certificate_file,
        tls_version=ssl.PROTOCOL_TLSv1_2)
    mqtts_client.tls_insecure_set(False)
    mqtts_client.username_pw_set(client_username, client_password)

    # Hook up the callback functions
    mqtts_client.on_connect = on_connect
    mqtts_client.on_disconnect = on_disconnect
    mqtts_client.on_publish = on_publish
    mqtts_client.on_subscribe = on_subscribe
    mqtts_client.on_unsubscribe = on_unsubscribe
    mqtts_client.on_message = on_message

    # Connect to the MQTT broker and start Paho's event loop
    print("Connecting to the MQTT broker...")
    mqtts_client.connect(host, port=8883)
    mqtts_client.loop_start()

    while not connected:  # Wait until the connection completes
        time.sleep(0.5)

    print("Subscribing to topic...")
    mqtts_client.subscribe(topic_name)
    while not subscribed:  # Wait until the subscription completes
        time.sleep(0.5)

    for i in range(10):  # Wait 10 seconds for the message to arrive
        time.sleep(1)

    print("Unsubscribing from the topic...")
    mqtts_client.unsubscribe(topic_name)
    while subscribed:  # Wait until the un-subscription completes
        time.sleep(0.5)

    print("Disconnecting from the MQTT broker...")
    mqtts_client.disconnect()
    while connected:  # Wait until the disconnect completes
        time.sleep(0.5)

    mqtts_client.loop_stop()

    print("Done!")
