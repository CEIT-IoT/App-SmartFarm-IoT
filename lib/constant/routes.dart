import 'package:app_iot/screens/home/home.dart';
import 'package:app_iot/screens/login/login.dart';
import 'package:app_iot/screens/register/register.dart';
import 'package:flutter/cupertino.dart';

class Route {
  static const login = 'login';
  static const register = 'register';
  static const home = 'home';

  static Map<String, WidgetBuilder> getAll() => _route;
  static final Map<String, WidgetBuilder> _route = {
    'login': (context) => Login(),
    'register': (context) => const Register(),
    'home': (context) => const Home()
  };
}
