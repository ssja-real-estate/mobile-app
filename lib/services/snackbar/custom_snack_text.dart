import 'package:flutter/cupertino.dart';
import 'package:saja/resources/fonts.dart';

class CustomSnackText {
  static Widget customText({required String text}) {
    return Text(
      text,
      style: TextStyle(fontFamily: AppFonts.iranSans),
    );
  }
}
