import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:app_iot/const.dart';

late MqttServerClient client;

mqttSubscribe({required String message}) async {
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
    client.subscribe('CEIT-iot/Mushroom/Valve', MqttQos.atMostOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      log("message payload => " + pt);
      var message = pt;
      // var box = Hive.box('messages');
      // var doc = json.decode(utf8.decode(pt.codeUnits));
      // add to hivedb
      // var message =
      //     '{"message" : "${doc["message"]}", "from" : "${doc["from"]}" ,"timeStamp" : "${doc["timeStamp"]}" }';
      // box.put(doc["timeStamp"], message);
    });
  }
}

mqttPublish({required String message}) async {
  client =
      MqttServerClient.withPort(mqttHost, mqttClientId + "_Valve", mqttPort);
  client.keepAlivePeriod = 30;
  client.autoReconnect = true;
  await client.connect();

  client.onConnected = () {
    log('MQTT connected');
  };

  client.onDisconnected = () {
    log('MQTT disconnected');
  };

  client.onSubscribed = (String topic) {
    log('MQTT subscribed to $topic');
  };
  final builder = MqttClientPayloadBuilder();
  var timeStamp = DateTime.now().microsecondsSinceEpoch.toString();
  // var messagsString =
  //     '{"message" : "$message", "from" : "$userId" ,"timeStamp" : "$timeStamp" }';
  // var messagsString = '{"message": "$message"}';
  log("public message: $message");
  builder.addUTF8String(message);
  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    client.publishMessage(
        'CEIT-iot/Mushroom/Valve', MqttQos.exactlyOnce, builder.payload!,
        retain: true);
  }
}




// class MqttPublish {
//   MqttServerClient client =
//       MqttServerClient.withPort(mqttHost, mqttClientId, mqttPort);
//   MqttPublish(String message);

//   // String username = '3acc3ff771b74cb28e8b12ba97c13939';
//   // String password = '7a389fec5e204cd3838597dac5462e94';

//   Future<int> connect() async {
//     client.logging(on: true);
//     client.keepAlivePeriod = 60;
//     client.onConnected = onConnected;
//     client.onDisconnected = onDisconnected;
//     client.onSubscribed = onSubscribed;
//     client.pongCallback = pong;

//     final connMessage =
//         MqttConnectMessage().startClean().withWillQos(MqttQos.atLeastOnce);
//     client.connectionMessage = connMessage;

//     try {
//       // await client.connect(username, password);
//       await client.connect();
//     } on NoConnectionException catch (e) {
//       print('MQTTClient::Client exception - $e');
//       client.disconnect();
//     } on SocketException catch (e) {
//       print('MQTTClient::Socket exception - $e');
//       client.disconnect();
//     }

//     return 0;
//   }

//   void disconnect() {
//     client.disconnect();
//   }

//   void subscribe(String topic) {
//     client.subscribe(topic, MqttQos.atLeastOnce);
//   }

//   void onConnected() {
//     print('MQTTClient::Connected');
//   }

//   void onDisconnected() {
//     print('MQTTClient::Disconnected');
//   }

//   void onSubscribed(String topic) {
//     print('MQTTClient::Subscribed to topic: $topic');
//   }

//   void pong() {
//     print('MQTTClient::Ping response received');
//   }

//   void publishMessage(String message) {
//     MqttPublish(message);
//     String topic = "CEIT-iot/Mushroom/Valve";
//     final builder = MqttClientPayloadBuilder();
//     builder.addString(message);
//     client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
//   }

//   Stream<List<MqttReceivedMessage<MqttMessage>>>? getMessagesStream() {
//     return client.updates;
//   }
// }









// class BTValveController extends GetxController {
//   late MqttServerClient client;
//   final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
//   // ignore: non_constant_identifier_names
//   RxString Valve = "".obs;

//   @override
//   void onInit() {
//     super.onInit();
//     log("onInit");
//     mqttPublish();
//   }

//   void mqttPublish() async {
//     client =
//         MqttServerClient.withPort(mqttHost, mqttClientId + "_Valve", mqttPort);
//     client.keepAlivePeriod = 30;
//     client.autoReconnect = true;
//     await client.connect();

//     client.onConnected = () {
//       log('MQTT connected');
//     };

//     client.onDisconnected = () {
//       log('MQTT disconnected');
//     };

//     client.onSubscribed = (String topic) {
//       log('MQTT subscribed to $topic');
//     };

//     if (client.connectionStatus!.state == MqttConnectionState.connected) {
//       builder.addString(json.encode({
//         "status": "$data",
//       }));
//       client.publishMessage(
//           "CEIT-iot/Mushroom/Valve", MqttQos.exactlyOnce, builder.payload!);
//       log("message payload 2 => " + data.toString());
//     }
//   }
// }