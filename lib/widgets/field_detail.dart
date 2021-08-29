import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:saja/models/enums/field_type.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/widgets/custom_image_slider.dart';

class FieldDetail extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String title;
  final FieldType type;
  final dynamic value;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final List<Widget>? innerFields;
  final CarouselController? imageSliderController;
  final int? activeIndex;
  final dynamic Function(int)? onDotClicked;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  const FieldDetail({
    Key? key,
    this.margin,
    this.padding,
    required this.title,
    required this.type,
    required this.value,
    this.titleFontSize,
    this.titleFontWeight,
    this.innerFields,
    this.imageSliderController,
    this.activeIndex,
    this.onDotClicked,
    this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: _buildDetail(),
    );
  }

  Widget? _buildDetail() {
    Widget? widget;
    var titleStyle = TextStyle(
      fontSize: titleFontSize ?? 16,
      fontWeight: titleFontWeight ?? FontWeight.normal,
    );

    switch (type) {
      case FieldType.String:
      case FieldType.Number:
      case FieldType.Select:
        widget = Row(
          children: [
            Text(
              '$title: ',
              style: titleStyle,
            ),
            SizedBox(
              width: 5,
            ),
            Text(value.toString()),
          ],
        );
        break;
      case FieldType.Bool:
        bool isPositive = value as bool;
        widget = Row(
          children: [
            Text(
              '$title: ',
              style: titleStyle,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              isPositive ? Icons.check_circle : Icons.highlight_off,
              color: isPositive ? AppColors.green() : AppColors.red(),
            ),
            // Text(field.value.toString()),
          ],
        );
        break;
      case FieldType.Conditional:
        bool isPositive = value as bool;
        widget = Column(
          children: [
            Row(
              children: [
                (isPositive) ? Text('$title: ', style: titleStyle) : SizedBox(),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  isPositive ? Icons.check_circle : Icons.highlight_off,
                  color: isPositive ? AppColors.green() : AppColors.red(),
                )
              ],
            ),
            SizedBox(
              height: isPositive ? 20 : null,
            ),
            (isPositive)
                ? Column(
                    children: innerFields ?? [],
                  )
                : SizedBox(),
          ],
        );
        break;
      case FieldType.Image:
        var images = (value as List).map((e) => e as String).toList();
        print(images);
        widget = CustomImageSlider(
          imageUrls: images,
          imageSliderController: imageSliderController!,
          activeIndex: activeIndex!,
          onDotClicked: onDotClicked,
          onPageChanged: onPageChanged,
          margin: EdgeInsets.only(
            top: 30,
            bottom: 30,
          ),
        );
        break;
      default:
    }

    return widget;
  }
}
