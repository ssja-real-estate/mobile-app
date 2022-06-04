import 'package:flutter/cupertino.dart';
import 'package:saja/resources/fonts.dart';

class CustomSnackText {
  static Widget customText({required String text, double? fontSize,FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(fontFamily: AppFonts.iranSans, fontSize: fontSize,fontWeight:fontWeight ),
    );
  }
}
