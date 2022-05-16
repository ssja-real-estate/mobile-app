import 'dart:convert';
import 'package:get/get.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/api/api.dart';

import '../resources/api.dart';

class User {
  late int id, role;
  late String name, password, mobile, token;

  static final User _instance = User._internal();
  factory User() => _instance;
  User._internal();

  //methods

  String signUptoJson() {
    //test
    password = 13552797.toString();
    mobile = 09144444444.toString();
    return jsonEncode(
        {ApiStrings.password: password, ApiStrings.mobile: mobile});
  }
}
