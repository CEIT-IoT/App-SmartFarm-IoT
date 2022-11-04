import 'package:app_iot/constant/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void dialogSuccess(BuildContext context, String title, String content,
    String buttonText, String route) {
  showDialog(
      context: context,
      builder: (_) => Dialog(
            child: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    success,
                    width: 75,
                    height: 75,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            primary: Color(0xFF2DD284)),
                        onPressed: () {
                          Navigator.pushNamed(context, route);
                          // Navigator.pushNamed(context, route);
                        },
                        child: Text(buttonText)),
                  )
                ],
              ),
            ),
          ));
}
