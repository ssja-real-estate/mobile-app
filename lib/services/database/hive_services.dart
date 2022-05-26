import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/login_status.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/api.dart';
import 'package:saja/resources/database.dart';

class HiveServices {
  static Future tokenToDatabase(
      {required String token, required Box box}) async {
    print("token is : " + token);
    await HiveDatabase.put(
        key: DatabaseStrings.tokenKey, box: box, value: token.toString());
  }

  static Future databaseToTokenUser(
      {required Box box, required User user}) async {
    user.token =
        await HiveDatabase.get(key: DatabaseStrings.tokenKey, box: box);
  }

  static Future loginSetStatus(
      {required Box loginBox, required String status}) async {
    await HiveDatabase.put(
        box: loginBox, key: DatabaseStrings.loginKey, value: status);
  }

  static Future<bool> databaseInitializing() async {
    await Hive.initFlutter();

    Box box = await HiveDatabase.openBox(boxName: DatabaseStrings.userBox);
    if (HiveDatabase.boxkeys(box: box).toList().length != 0) {
      await HiveServices.databaseToTokenUser(user: User(), box: box);
      await HiveDatabase.close();
      return true;
    }
    await HiveDatabase.close();
    return false;
  }

  static Future loginInitializing(bool bool) async {
    if (!bool) {
      Box box = await HiveDatabase.openBox(boxName: DatabaseStrings.loginBox);
      await HiveServices.loginSetStatus(
          loginBox: box, status: LoginStatuses.notLoggedIn.name);
    }
    await HiveDatabase.close();
  }
}
