import 'package:app_iot/model/temperatureData.dart';
import 'package:app_iot/packages/chart.dart';
import 'package:app_iot/services/mqtt.dart';
import 'package:app_iot/widgets/circleprogress.dart';
import 'package:app_iot/widgets/custom_paint.dart';
import 'package:app_iot/widgets/swith_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:app_iot/services/mqtt.dart';

class Dashboard1Page extends StatelessWidget {
  const Dashboard1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                "ໂຮງເຮືອນທີ1",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: ListView(
              children: [
                GetBuilder<BatteryController>(
                  init: BatteryController(),
                  id: 'battery',
                  builder: (batteryController) {
                    return CustomPaintCircleProgress(
                      value: 28,
                      title: "ອຸນຫະພູມ",
                      symbol: " 'ໍC",
                      ues: true,
                    );
                  },
                ),
                const SwithButton(
                  title: 'ພັດລົມ',
                  pubTopic: 'esp/fan',
                ),
                const SwithButton(
                  title: 'ນ້ຳ',
                  pubTopic: 'esp/led',
                ),
                LineChartWidget(temperaturePoints),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
