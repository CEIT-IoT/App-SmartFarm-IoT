import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> LogoutPreference() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  exit(0);
}
