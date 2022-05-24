import 'package:flutter/material.dart';

class SingleTextInput extends StatelessWidget {
  final String? label;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final TextDirection? textDirection;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextAlign textAlign;

  const SingleTextInput({
    Key? key,
    @required this.label,
    this.onChanged,
    this.inputType,
    this.textDirection = TextDirection.ltr,
    this.margin,
    this.padding,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      padding: this.padding,
      child: TextField(
        autofocus: false,
        keyboardType: this.inputType,
        textDirection: this.textDirection,
        textAlign: this.textAlign,
        decoration: InputDecoration(
          labelText: this.label,
          alignLabelWithHint: true,
          hintTextDirection: TextDirection.ltr,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onChanged: this.onChanged,
      ),
    );
  }
}
