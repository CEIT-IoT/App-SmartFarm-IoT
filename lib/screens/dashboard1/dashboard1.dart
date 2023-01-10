import 'dart:developer';

import 'package:app_iot/constant/get_box.dart';
import 'package:app_iot/model/temperatureData.dart';
import 'package:app_iot/packages/chart.dart';
import 'package:app_iot/services/mqtt/buttonValve_mushroom.dart';
import 'package:app_iot/services/mqtt/humidity_mushroom.dart';
import 'package:app_iot/services/mqtt/temperature_mushroom.dart';
import 'package:app_iot/widgets/circleprogress.dart';
import 'package:app_iot/widgets/custom_paint.dart';
import 'package:app_iot/widgets/swith_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:mqtt_client/mqtt_client.dart';

// ignore: must_be_immutable
class Dashboard1Page extends StatefulWidget {
  const Dashboard1Page({Key? key}) : super(key: key);

  @override
  State<Dashboard1Page> createState() => _Dashboard1PageState();
}

class _Dashboard1PageState extends State<Dashboard1Page> {
  late String message = '';
  bool? statusBT;

  @override
  Widget build(BuildContext context) {
    mqttSubscribe(message: message);
    if (message == "true") {
      statusBT = true;
    } else if (message == "false") {
      statusBT = false;
    }
    // ignore: non_constant_identifier_names
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
                GetBuilder<TemperatureController>(
                  init: TemperatureController(),
                  id: 'temperature',
                  builder: (temperatureController) {
                    double? temvalue = 0;
                    double? temperature = double.tryParse(temperatureController
                        .temperature.value
                        .toString()
                        .replaceAll(",", ""));
                    if (temperature != null) {
                      temvalue = temperature;
                    }
                    return CustomPaint(
                      foregroundPainter: CircleProgress(temvalue, true),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('ອຸ່ນຫະພູມ'),
                              Text(temperatureController.temperature.value,
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                              const Text(
                                '°C',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                GetBuilder<HumidityController>(
                  init: HumidityController(),
                  id: 'humidity',
                  builder: (humidityController) {
                    double? humvalue = 0;
                    double? humidity = double.tryParse(humidityController
                        .humidity.value
                        .toString()
                        .replaceAll(",", ""));
                    if (humidity != null) {
                      humvalue = humidity;
                    }
                    return CustomPaint(
                      foregroundPainter: CircleProgress(humvalue, false),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('ຄວາມຊຸ່ມ'),
                              Text(humidityController.humidity.value,
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                              const Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "ປໍ້ານ້ຳ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: LiteRollingSwitch(
                          value: statusBT ?? false,
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
                            (state) ? message = "true" : message = "false";
                            log("send message: $message");
                            mqttPublish(message: message);
                            // box.write('valve1', BTValue);
                            // box.read('valve1');
                            // setState(() {});
                            // print(box.read('valve1'));
                            // box.listen(() {
                            //   print(box.read('valve1'));
                            // });
                            //   if (state) {}
                          },
                          onDoubleTap: () {},
                          onSwipe: () {},
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
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
