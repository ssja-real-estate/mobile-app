import 'package:flutter/material.dart';
import 'package:saja/models/estate_item.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final estates = List.generate(
    30,
    (index) => EstateItem(
      id: "id",
      estateType: "estateType",
      delegationType: "delegationType",
      province: "province",
      city: "city",
      price: 100000,
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

        // SliverAppBar(
        //   title: ElevatedButton(
        //     style: ButtonStyle(
        //       backgroundColor: MaterialStateProperty.all(AppColors.primary()),
        //       elevation: MaterialStateProperty.all(0),
        //     ),
        //     onPressed: () {
        //       // TODO: filter
        //     },
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(AppStrings.filter),
        //         SizedBox(width: 10),
        //         Icon(Icons.filter_list_rounded),
        //       ],
        //     ),
        //   ),
        //   centerTitle: true,
        //   pinned: true,
        //   automaticallyImplyLeading: true,
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var estate = estates[index];
              return Column(
                children: [
                  Row(
                    children: [
                      Text(estate.delegationType),
                      Text(estate.estateType),
                    ],
                  ),
                  Row(
                    children: [
                      Text(estate.province),
                      Text(estate.city),
                    ],
                  ),
                  Text(estate.price.toString())
                ],
              );
            },
            childCount: estates.length,
          ),
        )
      ],
    );
  }
}
