import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/api.dart';

class HiveServices {
  static Future userToDatabase(
      {required String userJson, required Box box}) async {
    Map map = jsonDecode(userJson);
    await box.putAll(map);
  }

  static Future databaseToUser({required Box box, required User user}) async {
    user.id = await box.get(ApiStrings.id);
    user.name = await box.get(ApiStrings.name);
    user.mobile = await box.get(ApiStrings.mobile);
    user.password = await box.get(ApiStrings.password);
    user.token = await box.get(ApiStrings.token);
    user.role = await box.get(ApiStrings.role);
  }
}
