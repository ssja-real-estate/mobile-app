import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? color;

  const CustomTextButton({
    Key? key,
    this.title = '',
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Text(title),
      ),
    );
  }
}
