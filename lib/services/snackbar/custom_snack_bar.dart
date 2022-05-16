import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saja/services/snackbar/custom_snack_text.dart';

class CustomSnackBar {
  static void showSnackbar({required String title, String message = ''}) {
    Get.snackbar(
      '',
      "",
      titleText: Center(
        child: CustomSnackText.customText(text: title),
      ),
      messageText: Center(
        child: CustomSnackText.customText(text: message),
      ),
    );
  }
}
