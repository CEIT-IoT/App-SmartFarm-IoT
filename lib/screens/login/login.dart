import 'package:app_iot/screens/login/components/body.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String emailPref = '';

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   LoginPreference().getPrefEmailLogin().then((value) {
  //     setState(() {
  //       emailPref = value;
  //       if (emailPref.isNotEmpty)
  //         Navigator.pushReplacementNamed(context, custom_route.Route.home);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Scaffold(body: Body()));
  }
}
