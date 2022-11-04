import 'package:app_iot/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_iot/constant/images.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      duration: 2000,
      splash: Image.asset(
        logo,
        width: 400,
        height: 400,
      ),
      nextScreen: Login(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
