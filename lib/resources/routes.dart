import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saja/models/enums/map_type.dart';
import 'package:saja/resources/screen_indexes.dart';
import 'package:saja/screens/add_estate/estate_delegation_type.dart';
import 'package:saja/screens/add_estate/forms.dart';
import 'package:saja/screens/add_estate/province_city.dart';
import 'package:saja/screens/main_app.dart';
import 'package:saja/screens/map/map.dart';
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
  static const mapAdd = "/map-add";
  static const mapView = "/map-view";
}

class Routs {
  static List<GetPage<dynamic>> getPages = [
    GetPage(
        name: RouteNames.mainAppHome,
        page: (() => MainAppScreen(
              tabIndex: ScreenIndexes.home,
            )),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.mainAppAddEstate,
        page: (() => MainAppScreen(
              tabIndex: ScreenIndexes.addEstate,
            )),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.mainAppProfile,
        page: (() => MainAppScreen(
              tabIndex: ScreenIndexes.profile,
            )),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.signup,
        page: () => SignupScreen(),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.forgetPass,
        page: () => ForgetPassScreen(),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.changePass,
        page: () => ChangePasswordScreen(),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.estateDelegationType,
        page: () => EstateDelegationTypeScreen(),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.ProvinceCity,
        page: () => ProvinceCityScreen(),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.addEstateForms,
        page: () => AddEstateFormsScreen(),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.main,
        page: () => MainAppScreen(),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.mapAdd,
        page: () => MapScreeen(
              mapType: MapType.choose,
            ),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
    GetPage(
        name: RouteNames.mapView,
        page: () => MapScreeen(
              mapType: MapType.view,
            ),
        curve: CustomTransitonClass.defultCurve,
        transition: CustomTransitonClass.transition,
        transitionDuration: CustomTransitonClass.transitionDuration),
  ];
}

class CustomTransitonClass {
  static const Transition transition = Transition.circularReveal;
  static const Curve defultCurve = Curves.linear;
  static const Duration transitionDuration = Duration(seconds: 2);
}
