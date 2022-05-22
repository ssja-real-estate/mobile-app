import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/login_status.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/api.dart';
import 'package:saja/resources/database.dart';

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
    print("values in hive services databasetouser   user box is");
    print(box.keys);
    print(box.values);
    print(user.password);
  }

  static Future loginSetStatus(
      {required Box loginBox, required String status}) async {
    await HiveDatabase.put(
        box: loginBox, key: DatabaseStrings.loginKey, value: status);
  }

  static Future<bool> databaseInitializing({required Box box}) async {
    await Hive.initFlutter();

    if (HiveDatabase.boxkeys(box: box).toList().length != 0) {
      await HiveServices.databaseToUser(user: User(), box: box);
      await HiveDatabase.close();
      return true;
    }
    await HiveDatabase.close();
    return false;
  }

  static Future loginInitializing(
      {required bool bool, required Box box}) async {
    if (!bool) {
      await HiveServices.loginSetStatus(
          loginBox: box, status: LoginStatuses.notLoggedIn.name);
    }
    await HiveDatabase.close();
  }

  static Future setLastLatLngPositions(
      {required LatLng latLng, required Box box}) async {
    await HiveDatabase.put(
        box: box,
        key: DatabaseStrings.latitude,
        value: latLng.latitude.toString());
    await HiveDatabase.put(
        box: box,
        key: DatabaseStrings.longitude,
        value: latLng.longitude.toString());
  }

  static Future<LatLng> getLastLatLngPosition({required Box box}) async {
    double? longitude = double.parse(
        await HiveDatabase.get(box: box, key: DatabaseStrings.longitude) ??
            DatabaseStrings.mahabadLong);
    double? latitude = double.parse(
        await HiveDatabase.get(box: box, key: DatabaseStrings.latitude) ??
            DatabaseStrings.mahabadLat);
    return LatLng(latitude, longitude);
  }
}
