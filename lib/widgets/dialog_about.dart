import 'package:app_iot/constant/images.dart';
import 'package:flutter/material.dart';

void dialogAbout(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => Dialog(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        iotlogo,
                        height: 80,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "    ເເອັບນີ້ເເມ່ນສ້າງຂື້ນມາເພື່ອໃຊ້ເຊື່ອມຕໍ່ກັບລະບົບInternet Of Things ເພື່ອຄວບຄຸມເເລະສະເເດງຄ່າຕ່າງໆ.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "IoTLab@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Version-0.1",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Expanded(
                      child: Container(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black54)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('ກັບຄືນ')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
}
