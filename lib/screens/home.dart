import 'package:flutter/material.dart';
import 'package:saja/models/estate/estate_item.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/estate_item.dart';
import 'package:saja/widgets/shimmers/estate_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _shimmerItemsCount = 5;
  bool isLoading = false;
  List<EstateItem> estates = [];

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
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
              var estate = (isLoading) ? null : estates[index];
              return (isLoading)
                  ? EstateItemShimmer()
                  : EstateItemWidget(
                      estate!,
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
            childCount: (isLoading) ? _shimmerItemsCount : estates.length,
          ),
        )
      ],
    );
  }
}
