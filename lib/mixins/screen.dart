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

  List<String> getCitiesFromProvinces(
    dynamic provinceKey,
    Map<String, int> citiesMap,
    Map<String, int> provincesMap,
  ) {
    List<String> cities = citiesMap.entries.map((e) => e.key).toList();
    if (provinceKey != null) {
      int provinceId = provincesMap[provinceKey] ?? 0;
      if (provinceId != 0) {
        if (citiesMap.containsValue(provinceId)) {
          return citiesMap.entries
              .where((element) => element.value == provinceId)
              .map((e) => e.key)
              .toList();
        }
      }
    }
    return cities;
  }
}
