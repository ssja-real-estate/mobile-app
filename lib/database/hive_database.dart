import 'package:hive_flutter/hive_flutter.dart';

import 'package:hive/hive.dart';

class HiveDatabase {
  static Future<Box> openBox({required String boxName}) async {
    return await Hive.openBox(boxName);
  }

  static Future deleteBox({required String boxName}) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  static Future get({required Box box, required String key}) async {
    return await box.get(key);
  }

  static Future put(
      {required Box box, required String key, required String value}) async {
    await box.put(key, value);
  }

  static Future delete({required Box box, required String key}) async {
    await box.delete(key);
  }
}
