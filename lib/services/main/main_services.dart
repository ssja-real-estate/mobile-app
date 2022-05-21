import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saja/services/database/hive_services.dart';

class MainServices {
  static Future<void> initializing() async {
    widgetBindingInitializing();
    await databaseInitializing();
    systemChromeInitializing();
  }

  static Future<void> databaseInitializing() async {
    await HiveServices.loginInitializing(
        await HiveServices.databaseInitializing());
  }

  static void widgetBindingInitializing() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  static void systemChromeInitializing() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}
