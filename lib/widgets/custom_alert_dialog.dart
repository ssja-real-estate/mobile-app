import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final TextStyle? titleTextStyle;
  final EdgeInsets? titlePadding;
  final EdgeInsets? containerPadding;
  const CustomAlertDialog({
    Key? key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.titleTextStyle,
    this.titlePadding,
    this.containerPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: AlertDialog(
          title: title,
          actions: actions,
          backgroundColor: backgroundColor,
          titleTextStyle: titleTextStyle,
          titlePadding: titlePadding,
          actionsPadding: containerPadding ?? EdgeInsets.all(10),
        ),
      ),
    );
  }
}
