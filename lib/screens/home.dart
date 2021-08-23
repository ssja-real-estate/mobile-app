import 'package:flutter/material.dart';
import 'package:saja/models/estate_item.dart';

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
          title: Text('filter'),
          centerTitle: true,
          pinned: true,
          automaticallyImplyLeading: true,
        ),
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
