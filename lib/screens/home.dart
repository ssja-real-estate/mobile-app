import 'package:flutter/material.dart';
import 'package:saja/models/estate_item.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/base_info.dart';
import 'package:saja/screens/estate_detail.dart';
import 'package:saja/services/navigation/app_navigator.dart';
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
  void initState() {
    super.initState();
    String image =
        'https://images.unsplash.com/photo-1582407947304-fd86f028f716?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=859&q=80';
    setState(() {
      estates = List.generate(10, (index) {
        return EstateItem(
          id: index,
          estateType: 0,
          delegationType: 0,
          province: 'آذربایجان غربی',
          city: 'مهاباد',
          price: 100000,
          imageUrl: image,
        );
      });
    });
  }

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
            onPressed: () {
              AppNavigator.pushScreen(context,
                  BaseInfoScreen(nextScreenType: NextScreenType.FilterEstate));
            },
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
              EstateItem? estate = (isLoading) ? null : estates[index];
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
                      onTap: () {
                        AppNavigator.pushScreen(
                          context,
                          EstateDetailScreen(id: estate.id),
                        );
                      },
                    );
            },
            childCount: (isLoading) ? _shimmerItemsCount : estates.length,
          ),
        )
      ],
    );
  }
}
