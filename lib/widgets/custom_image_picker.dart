import 'package:flutter/material.dart';

import 'package:saja/resources/colors.dart';
import 'package:saja/widgets/custom_button.dart';

class CustomImagePicker extends StatelessWidget {
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final BoxBorder? border;
  final double? borderRadius;
  final void Function()? onPressed;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const CustomImagePicker({
    Key? key,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.border,
    this.borderRadius,
    this.onPressed,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      icon: icon ?? Icons.add_a_photo,
      iconColor: iconColor ?? AppColors.primary(),
      borderRadius: borderRadius ?? 10,
      color: backgroundColor ?? AppColors.white(),
      border: border ?? Border.all(color: AppColors.primary()),
      onPressed: onPressed,
      margin: margin,
      padding: padding,
    );
  }
}
