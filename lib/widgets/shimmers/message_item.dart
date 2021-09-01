import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:shimmer/shimmer.dart';

class MessageItemShimmer extends StatelessWidget {
  const MessageItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Shimmer.fromColors(
        child: Container(
          width: 300,
          height: 30,
          color: AppColors.shimmerBaseColor(),
        ),
        baseColor: AppColors.shimmerBaseColor(),
        highlightColor: AppColors.shimmerHighlightColor(),
      ),
    );
  }
}
