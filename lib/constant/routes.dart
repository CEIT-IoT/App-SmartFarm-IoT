import 'package:app_iot/screens/login/login.dart';
import 'package:flutter/cupertino.dart';

class Route {
  static const login = 'login';

  static Map<String, WidgetBuilder> getAll() => _route;
  static final Map<String, WidgetBuilder> _route = {
    'login': (context) => Login(),
  };
}
