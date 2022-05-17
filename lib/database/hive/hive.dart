import 'dart:io';

import 'package:hive/hive.dart';

class HiveDatabese {
  var path = Directory.current.path;
  late Box hiveBox;
  static Future<Box> openBox({required String boxName}) async {
    return Hive.box(boxName);
  }

  static Future get({required Box box, required String key}) async {
    return box.get(key);
  }

  static Future put(
      {required Box box, required String key, required String value}) async {
    await box.put(key, value);
  }

  static Future delete({required Box box, required String key}) async {
    await box.delete(key);
  }

  static Future boxDelete({required String boxName}) async {
    await Hive.deleteBoxFromDisk(boxName);
  }
}
