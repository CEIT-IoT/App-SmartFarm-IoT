import 'package:app_iot/services/mqtt.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:mqtt_client/mqtt_client.dart';

class SwithButton extends StatefulWidget {
  final String? title;
  final String? pubTopic;
  const SwithButton({Key? key, this.title, this.pubTopic}) : super(key: key);

  @override
  State<SwithButton> createState() => _SwithButtonState();
}

class _SwithButtonState extends State<SwithButton> {
  // MQTTClientManager mqttClientManager = MQTTClientManager();

  @override
  void initState() {
    // setupMqttClient();
    // setupUpdatesListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            child: LiteRollingSwitch(
              value: false,
              width: 100,
              textOn: 'ເປີດ',
              textOff: 'ປິດ',
              colorOn: Colors.blue,
              colorOff: Colors.blueGrey,
              iconOn: Icons.lightbulb_outline,
              iconOff: Icons.power_settings_new,
              animationDuration: const Duration(milliseconds: 300),
              onChanged: (bool state) {
                print('turned ${(state) ? 'on' : 'off'}');
                // mqttClientManager.publishMessage(
                //     widget.pubTopic!, '${(state) ? 'on' : 'off'}');
              },
              onDoubleTap: () {},
              onSwipe: () {},
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> setupMqttClient() async {
  //   await mqttClientManager.connect();
  //   mqttClientManager.subscribe(widget.pubTopic!);
  // }

  // void setupUpdatesListener() {
  //   mqttClientManager
  //       .getMessagesStream()!
  //       .listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
  //     final recMess = c![2].payload as MqttPublishMessage;
  //     final pt =
  //         MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
  //     print('MQTTClient::Message received on topic: <${c[0].topic}> is $pt\n');
  //   });
  // }

  // @override
  // void dispose() {
  //   mqttClientManager.disconnect();
  //   super.dispose();
  // }
}
