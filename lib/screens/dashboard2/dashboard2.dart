import 'package:app_iot/model/temperatureData.dart';
import 'package:app_iot/packages/chart.dart';
import 'package:app_iot/widgets/circleprogress.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Dashboard2Page extends StatelessWidget {
  const Dashboard2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(),
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "ໂຮງເຮືອນທີ2",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                CustomPaint(
                  foregroundPainter: CircleProgress(25, true),
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('ອຸ່ນຫະພູມ'),
                          Text(
                            '25',
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '°C',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomPaint(
                  foregroundPainter: CircleProgress(60, false),
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('ຄວາມຊູ່ມ'),
                          Text(
                            '60',
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '%',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ປໍ້ານ້ຳ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                          },
                          onDoubleTap: () {},
                          onSwipe: () {},
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ອັດຕະໂນມັດ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                          },
                          onDoubleTap: () {},
                          onSwipe: () {},
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
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
