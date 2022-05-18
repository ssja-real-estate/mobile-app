import 'dart:async';

import 'package:saja/database/shared_pref/services.dart';
import 'package:saja/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref _instance = SharedPref._internal();
  factory SharedPref() => _instance;
  SharedPref._internal();
  SharedPreferences? prefs;
  static Future saveContent(
      {required SharedPreferences prefs,
      required String key,
      required String value}) async {
      
    await prefs.setString(key, value);
  }

  static Future getContent(
      {required SharedPreferences prefs,
      required String key,
      required User user}) async {
    var json = prefs.getString(key);
    if (!(json == null && json!.length == 0)) {
      SharedPrefServices.jsonToUser(user: user, json: json);
    }
  }
}
