import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:saja/resources/colors.dart';

class CustomImageSlider extends StatelessWidget {
  final List<String> imageUrls;
  final CarouselController imageSliderController;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final int activeIndex;
  final dynamic Function(int)? onDotClicked;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const CustomImageSlider({
    Key? key,
    required this.imageUrls,
    required this.imageSliderController,
    this.onPageChanged,
    required this.activeIndex,
    this.onDotClicked,
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
          CarouselSlider.builder(
            carouselController: imageSliderController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index, realIndex) {
              String imageUrl = imageUrls[index];
              return _buildImage(imageUrl, index);
            },
            options: CarouselOptions(
              height: 300,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: onPageChanged,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          _buildSmoothIndicator(),
        ],
      ),
    );
  }

  Widget _buildImage(String url, int index) {
    return Container(
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSmoothIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: imageUrls.length,
      effect: ExpandingDotsEffect(
        dotWidth: 12,
        dotHeight: 12,
        dotColor: AppColors.grey400(),
        activeDotColor: AppColors.primary(),
      ),
      onDotClicked: onDotClicked,
    );
  }
}
