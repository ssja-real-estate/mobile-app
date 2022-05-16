import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/fonts.dart';

class CustomDropDownButton extends StatefulWidget {
  final String? title;
  final List<String> menuItems;
  final Object? dropDownValue;
  final Function(Object?)? onChange;
  final String hint;
  final TextDirection? textDirection;
  final EdgeInsets? titleMargin;
  final EdgeInsets? titlePadding;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  CustomDropDownButton(
    this.title,
    this.menuItems, {
    @required this.dropDownValue,
    this.onChange,
    this.hint = '',
    this.textDirection,
    this.titleMargin,
    this.titlePadding,
    this.margin,
    this.padding,
  });

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.textDirection ?? TextDirection.rtl,
      child: Column(
        children: [
          if (widget.title != null)
            Container(
              alignment: Alignment.centerRight,
              margin: widget.titleMargin,
              padding: widget.titlePadding,
              child: Text(
                widget.title!,
                style: TextStyle(
                  color: AppColors.primary(),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          Container(
            margin: widget.margin,
            padding: widget.padding,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary(), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton(
              autofocus: false,
              icon: Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: AppColors.accent(),
              ),
              iconSize: 30,
              value: widget.dropDownValue,
              hint: Text(
                widget.hint,
                style: TextStyle(
                  fontFamily: AppFonts.iranSans,
                  color: AppColors.accent(),
                ),
              ),
              underline: SizedBox(),
              isExpanded: true,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.black(),
              ),
              dropdownColor: AppColors.white(),
              items: widget.menuItems.map((value) {
                return DropdownMenuItem(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: AppFonts.iranSans,
                        color: AppColors.accent(),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                FocusScope.of(context).requestFocus(new FocusNode());
                if (widget.onChange != null) {
                  widget.onChange!.call(value);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
