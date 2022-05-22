import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/services/database/hive_services.dart';

class MainServices {
  static Future<void> initializing() async {
    widgetBindingInitializing();
    await databaseInitializing();
    systemChromeInitializing();
  }

  static Future<void> databaseInitializing() async {
    Box userBox = await HiveDatabase.openBox(boxName: DatabaseStrings.userBox);
    bool init = await HiveServices.databaseInitializing(box: userBox);
    Box loginBox =
        await HiveDatabase.openBox(boxName: DatabaseStrings.loginBox);

    await HiveServices.loginInitializing(
      bool: init,
      box: loginBox,
    );
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
