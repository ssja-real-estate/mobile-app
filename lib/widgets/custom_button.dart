import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? margin;
  final MainAxisSize? mainAxisSize;
  final double? elevation;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final MainAxisAlignment? mainAxisAlignment;
  final double? iconPadding;
  final Color? iconColor;
  final double? iconSize;

  const CustomButton({
    Key? key,
    this.title = '',
    this.onPressed,
    this.verticalPadding = 15,
    this.horizontalPadding = 0,
    this.fontSize = 24,
    this.icon,
    this.color,
    this.textColor = Colors.white,
    this.margin,
    this.mainAxisSize,
    this.elevation,
    this.borderRadius,
    this.fontWeight = FontWeight.w300,
    this.mainAxisAlignment,
    this.iconPadding = 5,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: this.onPressed,
        child: Row(
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: textColor,
              ),
            ),
            SizedBox(
              width: iconPadding,
            ),
            (icon != null)
                ? Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  )
                : SizedBox(),
          ],
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(
            top: verticalPadding,
            bottom: verticalPadding,
            right: horizontalPadding,
            left: horizontalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
          ),
          primary: color,
          elevation: elevation ?? 0,
        ),
      ),
    );
  }
}
