import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saja/services/database/hive_services.dart';
import 'screens/app.dart';

void main() async {
  await initializing();
  runApp(App());
}

Future<void> initializing() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveServices.loginInitializing(
      await HiveServices.databaseInitializing());
  systemChromeInitializing();
}

void systemChromeInitializing() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}
