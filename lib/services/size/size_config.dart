

import 'package:flutter/material.dart';

class SizeConfig {
  BuildContext context;
  MediaQueryData? sizedata;
  double? _height;
  double? _width;
  SizeConfig(this.context) {
    sizedata = MediaQuery.of(context);
    _height = sizedata!.size.height / 100;
    _width = sizedata!.size.width / 100;
  }
// height of screen :640.0
// width of screen :360.0
  double width(value) {
    return _width! * value;
  }

  double height(value) {
    return _height! * value;
  }
}
