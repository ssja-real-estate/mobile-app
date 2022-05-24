import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:shimmer/shimmer.dart';

class EstateItemShimmer extends StatelessWidget {
  EstateItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 1, color: AppColors.white()),
        ),
        child: Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor(),
          highlightColor: AppColors.shimmerHighlightColor(),
          child: InkWell(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 12,
                      left: 10,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 20,
                                color: AppColors.shimmerBaseColor(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 140,
                                height: 20,
                                color: AppColors.shimmerBaseColor(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 100,
                                height: 20,
                                color: AppColors.shimmerBaseColor(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: AppColors.shimmerBaseColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
