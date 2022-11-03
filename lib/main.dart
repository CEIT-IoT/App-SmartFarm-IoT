import 'package:flutter/material.dart';
import 'constant/routes.dart' as custom_route;
import 'packages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: custom_route.Route.getAll(),
        debugShowCheckedModeBanner: false,
        home: Splash());
  }
}
