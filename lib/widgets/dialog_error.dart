import 'package:app_iot/constant/images.dart';
import 'package:flutter/material.dart';

void dialogError(
    BuildContext context, String title, String content, String buttonText) {
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
                    warning,
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
                            primary: Color(0xFFF65656)),
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, route);
                        },
                        child: Text(buttonText)),
                  )
                ],
              ),
            ),
          ));
}
