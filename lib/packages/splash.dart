import 'package:app_iot/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_iot/constant/images.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      duration: 3000,
      splash: Image.asset(
        logo,
        width: 200,
        height: 200,
      ),
      nextScreen: Login(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
