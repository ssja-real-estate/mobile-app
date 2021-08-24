import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:shimmer/shimmer.dart';

class EstateItemImageShimmer extends StatelessWidget {
  EstateItemImageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor(),
      highlightColor: AppColors.shimmerHighlightColor(),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: AppColors.shimmerBaseColor(),
        ),
      ),
    );
  }
}
