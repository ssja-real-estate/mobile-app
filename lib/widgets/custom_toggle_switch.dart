import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';

class CustomToggleSwitch extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool)? onChanged;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  const CustomToggleSwitch({
    Key? key,
    required this.label,
    required this.value,
    this.onChanged,
    this.margin,
    this.padding,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary(),
            activeTrackColor: AppColors.accent100(),
          ),
        ],
      ),
    );
  }
}
