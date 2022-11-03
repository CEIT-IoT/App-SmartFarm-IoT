import 'package:flutter/material.dart';
import 'package:app_iot/constant/images.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(logo))),
    );
  }
}
