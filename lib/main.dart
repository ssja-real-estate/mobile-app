import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/app.dart';

void main() {
  // HttpOverrides.global = new MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(App());
}
