import 'dart:convert';

import 'package:saja/models/user_model.dart';
import 'package:saja/resources/api.dart';

class SharedPrefServices {
  static void jsonToUser({required User user, required String json}) {
    var object = jsonDecode(json);
    user.id = object[ApiStrings.id];
    user.name = object[ApiStrings.name];
    user.mobile = object[ApiStrings.mobile];
    user.token = object[ApiStrings.token];
    user.password = object[ApiStrings.password];
    user.role = object[ApiStrings.role];
  }
}
