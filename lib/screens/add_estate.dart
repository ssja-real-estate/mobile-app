import 'package:flutter/material.dart';

class AddEstateScreen extends StatelessWidget {
  static const valueKey = ValueKey('AddEstate');

  const AddEstateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Add Estate'),
      ),
    );
  }
}