import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';

mixin ScreenMixin {
  Widget sectionTitle(
    String title, {
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? fontSize = 20,
    FontWeight? fontWeight,
  }) {
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: AppColors.primary(),
        ),
      ),
    );
  }

  Widget divider({
    double? indent = 30,
    double? endIndent = 30,
    double? thickness = 2,
    double? bottomPadding = 20,
  }) {
    return Column(
      children: [
        Divider(
          indent: indent,
          endIndent: endIndent,
          color: AppColors.primary(),
          thickness: thickness,
        ),
        SizedBox(
          height: bottomPadding,
        ),
      ],
    );
  }
}
