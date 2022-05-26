import 'package:flutter/material.dart';
import 'package:saja/resources/screen_indexes.dart';
import 'package:saja/screens/add_estate/estate_delegation_type.dart';
import 'package:saja/screens/add_estate/forms.dart';
import 'package:saja/screens/add_estate/province_city.dart';
import 'package:saja/screens/app.dart';
import 'package:saja/screens/main_app.dart';
import 'package:saja/screens/profile/change_pass.dart';
import 'package:saja/screens/profile/forget.dart';
import 'package:saja/screens/profile/signup.dart';

class RouteNames {
  static const main = "/";
  static const mainAppHome = "/main-app-home";
  static const mainAppAddEstate = "/main-app-addEstate";
  static const mainAppProfile = "/main-app-profile";
  static const signup = "/signup";
  static const forgetPass = "/forget-pass";
  static const changePass = "/change-pass";
  static const estateDelegationType = "/estate-delegation-type";
  static const ProvinceCity = "/province-city";
  static const addEstateForms = "/add-estate-forms";
}

class Routs {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.mainAppHome: ((p0) => MainAppScreen(
          tabIndex: ScreenIndexes.home,
        )),
    RouteNames.mainAppAddEstate: ((p0) => MainAppScreen(
          tabIndex: ScreenIndexes.addEstate,
        )),
    RouteNames.mainAppProfile: ((p0) => MainAppScreen(
          tabIndex: ScreenIndexes.profile,
        )),
    RouteNames.signup: (p0) => SignupScreen(),
    RouteNames.forgetPass: (p0) => ForgetPassScreen(),
    RouteNames.changePass: (p0) => changePasswordScreen(),
    RouteNames.estateDelegationType: (p0) => EstateDelegationTypeScreen(),
    RouteNames.ProvinceCity: (p0) => ProvinceCityScreen(),
    RouteNames.addEstateForms: (p0) => AddEstateFormsScreen(),
    RouteNames.main: (p0) => MainAppScreen()
  };
}
