import 'package:flutter/material.dart';
import 'package:saja/models/estate_item.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/estate_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final estates = List.generate(
    30,
    (index) => EstateItem(
      id: 1,
      estateType: 0,
      delegationType: 1,
      province: "آذربایجان غربی",
      city: "مهاباد",
      price: 100000,
      imageUrl:
          "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f0c98c0147a4f0006753d4b%2FHouses-of-different-size-with-different-value-on-stacks-of-coins--Concept-of-%2F960x0.jpg%3Ffit%3Dscale",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverAppBar(
          title: CustomButton(
            color: AppColors.primary(),
            title: AppStrings.filter,
            icon: Icons.filter_list_rounded,
            onPressed: () {},
            fontSize: 18,
            fontWeight: FontWeight.w500,
            mainAxisSize: MainAxisSize.min,
            verticalPadding: 5,
            horizontalPadding: 10,
            iconPadding: 10,
            iconSize: 30,
          ),
          centerTitle: true,
          pinned: true,
          automaticallyImplyLeading: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var estate = estates[index];
              return EstateItemWidget(
                estate,
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: EdgeInsets.only(
                  right: 12,
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                border: Border.all(
                  color: AppColors.accent(),
                  width: 1,
                ),
              );
            },
            childCount: estates.length,
          ),
        )
      ],
    );
  }
}
