import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/login_status.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/api.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/services/api/api.dart';

class HiveServices {
  static Future userToDatabase(
      {required String userJson, required Box box}) async {
    Map map = jsonDecode(userJson);
    await HiveDatabase.putAll(map: map, box: box);
    print("hive services : role in box is " +
        box.get(ApiStrings.role).toString());
    print("hive services : keys in box is " + box.keys.toString());
  }

  static Future databaseToUser({required Box box, required User user}) async {
    user.id = await HiveDatabase.get(key: ApiStrings.id, box: box);
    user.name = await HiveDatabase.get(key: ApiStrings.name, box: box);
    user.mobile = await HiveDatabase.get(key: ApiStrings.mobile, box: box);
    user.password = await HiveDatabase.get(key: ApiStrings.password, box: box);
    user.token = await HiveDatabase.get(key: ApiStrings.token, box: box);
    user.role = await HiveDatabase.get(key: ApiStrings.role, box: box);
  }

  static Future loginSaveStatus(
      {required Box loginBox, required String status}) async {
    await HiveDatabase.put(
        box: loginBox, key: DatabaseStrings.loginKey, value: status);
  }

  static Future<bool> databaseInitializing() async {
    await Hive.initFlutter();

    Box box = await HiveDatabase.openBox(boxName: DatabaseStrings.userBox);
    if (HiveDatabase.boxkeys(box: box).toList().length != 0) {
      await HiveServices.userToDatabase(userJson: User().toJson(), box: box);
      return true;
    }
    return false;
  }

  static Future loginInitializing(bool bool) async {
    if (!bool) {
      Box box = await HiveDatabase.openBox(boxName: DatabaseStrings.loginBox);
      await HiveDatabase.put(
          box: box,
          key: DatabaseStrings.loginKey,
          value: LoginStatuses.notLoggedIn.name);
    }
  }
}
