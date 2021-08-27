import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final TextStyle style;
  final Duration duration;
  final Curve curve;

  const CustomSnackBar({
    Key? key,
    required this.message,
    required this.style,
    required this.duration,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      child: Text(message),
      style: style,
      duration: duration,
      curve: curve,
      softWrap: true,
      overflow: TextOverflow.visible,
    );
  }
}
