import 'dart:convert';
import 'package:get/get.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/api/api.dart';

import '../resources/api.dart';

class User {
  late int? role;
  late String? id, name, password, mobile, token;

  static final User _instance = User._internal();
  factory User() => _instance;
  User._internal();

  //methods

  String toJson() {
    //test

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
