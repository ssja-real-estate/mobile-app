import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';

class FormPasswordInput extends StatefulWidget {
  final String? label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const FormPasswordInput({
    Key? key,
    @required this.label,
    this.validator,
    this.controller,
    this.onChanged,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  _FormPasswordInputState createState() => _FormPasswordInputState();
}

class _FormPasswordInputState extends State<FormPasswordInput> {
  bool isHidden = true;
  Icon icon = Icon(
    Icons.visibility_off_rounded,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        obscureText: isHidden,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: togglePassword,
            child: Container(child: icon),
            focusColor: AppColors.accent(),
          ),
          suffixIconConstraints: BoxConstraints(minWidth: 50),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: AppColors.accent(),
              width: 2,
            ),
          ),
          labelText: widget.label,
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
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }

  void togglePassword() {
    setState(() {
      isHidden = !isHidden;
      if (isHidden == false) {
        icon = Icon(
          Icons.visibility_rounded,
        );
      } else {
        icon = Icon(
          Icons.visibility_off_rounded,
        );
      }
    });
  }
}
