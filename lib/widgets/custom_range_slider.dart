import 'package:flutter/material.dart';
import 'package:saja/resources/strings.dart';

class CustomRangeSlider extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final RangeValues rangeValues;
  final double min;
  final double max;
  final void Function(RangeValues)? onChanged;
  final int? divisions;
  final RangeLabels? rangeLabels;
  final Color? activeColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  final TextStyle _rangeLabelStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  CustomRangeSlider({
    Key? key,
    required this.title,
    required this.titleStyle,
    required this.rangeValues,
    required this.min,
    required this.max,
    this.onChanged,
    this.divisions,
    this.rangeLabels,
    this.activeColor,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          RangeSlider(
            values: rangeValues,
            min: min,
            max: max,
            onChanged: onChanged,
            divisions: 1000,
            labels: rangeLabels,
            activeColor: activeColor,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    AppStrings.from,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    rangeValues.start.toInt().toString(),
                    style: _rangeLabelStyle,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(AppStrings.toman),
                ],
              ),
              Column(
                children: [
                  Text(
                    AppStrings.to,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    rangeValues.end.toInt().toString(),
                    style: _rangeLabelStyle,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(AppStrings.toman),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
