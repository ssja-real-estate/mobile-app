import 'package:hive_flutter/hive_flutter.dart';

import 'package:hive/hive.dart';

class HiveDatabase {
  static Future close() async {
    await Hive.close();
  }

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

  static Future putAll({required Box box, required map}) async {
    await box.putAll(map);
  }

  static Future deleteVal({required Box box, required String key}) async {
    await box.delete(key);
  }

  static Iterable boxkeys({required Box box}) {
    return box.keys;
  }

  static Future deleteDatabase() async {
    await Hive.deleteFromDisk();
  }

  static Future deleteBoxFromDatabase({required String boxName}) async {
    await Hive.deleteBoxFromDisk(boxName);
  }
}
