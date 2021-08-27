import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final double fontSize;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final MainAxisSize? mainAxisSize;
  final double? elevation;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final MainAxisAlignment? mainAxisAlignment;
  final double? iconPadding;
  final Color? iconColor;
  final double? iconSize;
  final TextAlign? textAlign;
  final TextDirection textDirection;
  final BoxBorder? border;

  const CustomButton({
    Key? key,
    this.title,
    this.onPressed,
    this.fontSize = 24,
    this.icon,
    this.color,
    this.textColor = Colors.white,
    this.margin,
    this.padding,
    this.mainAxisSize,
    this.elevation,
    this.borderRadius,
    this.fontWeight = FontWeight.w300,
    this.mainAxisAlignment,
    this.iconPadding,
    this.iconColor,
    this.iconSize,
    this.textAlign = TextAlign.center,
    this.textDirection = TextDirection.rtl,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: ElevatedButton(
          onPressed: this.onPressed,
          child: Row(
            mainAxisSize: mainAxisSize ?? MainAxisSize.max,
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
            children: [
              (title != null)
                  ? Text(
                      title!,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: textColor,
                      ),
                      textAlign: textAlign,
                    )
                  : SizedBox(),
              SizedBox(
                width: iconPadding ?? 0,
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
            padding: padding ??
                EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 0,
                ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 10)),
            ),
            primary: color,
            elevation: elevation ?? 0,
          ),
        ),
      ),
    );
  }
}
