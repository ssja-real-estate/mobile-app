import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/login_status.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/services/database/hive_services.dart';
import 'screens/app.dart';

void main() async {
  // HttpOverrides.global = new MyHttpOverrides();
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
