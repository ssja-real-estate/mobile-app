import 'package:flutter/material.dart';
import 'package:saja/resources/asset_addresses.dart';

import 'package:saja/resources/colors.dart';

class ImagePlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  const ImagePlaceholder({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          AppColors.grey400(),
          BlendMode.lighten,
        ),
        child: Image.asset(
          AppAssetAddress.logoAddress,
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
