import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:app_iot/const.dart';

class HumidityController extends GetxController {
  late MqttServerClient client;

  // battery json string
  RxString humidity = "".obs;

  @override
  void onInit() {
    super.onInit();
    log("onInit");
    mqttSubscribe();
  }

  void mqttSubscribe() async {
    client = MqttServerClient.withPort(mqttHost, mqttClientId, mqttPort);
    client.keepAlivePeriod = 30;
    client.autoReconnect = true;
    await client.connect().onError((error, stackTrace) {
      log("error -> " + error.toString());
    });
    client.onConnected = () {
      log('MQTT connected');
    };

    client.onDisconnected = () {
      log('MQTT disconnected');
    };

    client.onSubscribed = (String topic) {
      log('MQTT subscribed to $topic');
    };

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      client.subscribe(topic_hum_mushroom, MqttQos.exactlyOnce);
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final recMess2 = c[0].payload as MqttPublishMessage;
        final jsonString =
            MqttPublishPayload.bytesToStringAsString(recMess2.payload.message);
        log("message payload humidity => " + jsonString);
        // sample message
        // '{ "batteryLevel" : 82, "batteryStatus": "ok" }'
        // sample command
        // mosquitto_pub -h 192.168.43.146 -r  -t "battery" -m '{ "batteryLevel" : 82, "batteryStatus": "ok" }'
        // update to controller
        humidity.value = jsonString;
        update(['humidity']);
      });
    }
  }
}
