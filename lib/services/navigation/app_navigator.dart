import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppNavigator {
  static Future pushScreen<T extends Object?>(String route,
      {bool waiting: false}) async {
    if (waiting) {
      return await Get.toNamed(route);
    }

    Get.toNamed(
      route,
    );
  }

  static void popScreen<T extends Object?>({T? result}) {
    return Get.back(result: result);
  }

  static Future off(String route, {bool waiting: false}) async {
    if (waiting) {
      return await Get.offNamed(route);
    }
    return Get.offNamed(route);
  }

  static Future offAll(String route, {bool waiting: false}) async {
    if (waiting) {
      return await Get.offAll(route);
    }

    return Get.offAll(route);
  }
}
