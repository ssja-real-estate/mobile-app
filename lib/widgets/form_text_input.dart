import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';

class FormTextInput extends StatelessWidget {
  final String? label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final TextDirection? textDirection;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  const FormTextInput({
    Key? key,
    @required this.label,
    this.validator,
    this.controller,
    this.onChanged,
    this.inputType,
    this.textDirection = TextDirection.ltr,
    this.margin,
    this.padding,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      padding: this.padding,
      child: TextFormField(
        autofocus: false,
        keyboardType: this.inputType,
        controller: this.controller,
        textDirection: this.textDirection,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.accent(),
              width: 2,
            ),
          ),
          labelText: this.label,
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintTextDirection: TextDirection.ltr,
          focusColor: AppColors.accent(),
          hintStyle: TextStyle(
            fontSize: this.fontSize,
            fontWeight: FontWeight.w300,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onChanged: this.onChanged,
        validator: this.validator,
      ),
    );
  }
}
