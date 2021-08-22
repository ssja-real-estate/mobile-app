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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: this.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: this.fontSize,
                fontWeight: FontWeight.w300,
                color: textColor,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            (icon != null)
                ? Icon(
                    icon,
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
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          primary: this.color,
          elevation: 0,
        ),
      ),
    );
  }
}
