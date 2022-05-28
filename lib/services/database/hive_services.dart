import 'package:hive_flutter/hive_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/login_status.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/database.dart';

class HiveServices {
  static Future tokenToDatabase(
      {required String token, required Box box}) async {
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

  static Future<bool> databaseInitializing({required Box box}) async {

    if (HiveDatabase.boxkeys(box: box).toList().length != 0) {
      await HiveServices.databaseToTokenUser(user: User(), box: box);
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
