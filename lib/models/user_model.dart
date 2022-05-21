import 'dart:convert';

import '../resources/api.dart';

class User {
  late int? role = 0;
  late String? id = "", name = "", password = "", mobile = "", token = "";

  static final User _instance = User._internal();
  factory User() => _instance;
  User._internal();

  //methods

  String toJson() {
    return jsonEncode({
      ApiStrings.id: id ?? "",
      ApiStrings.name: name ?? "",
      ApiStrings.token: token ?? "",
      ApiStrings.role: role ?? 0,
      ApiStrings.password: password,
      ApiStrings.mobile: mobile,
    });
  }
 
}
