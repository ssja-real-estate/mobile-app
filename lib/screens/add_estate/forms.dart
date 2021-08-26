import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/widgets/custom_button.dart';

class AddEstateFormsScreen extends StatefulWidget {
  const AddEstateFormsScreen({Key? key}) : super(key: key);

  @override
  _AddEstateFormsScreenState createState() => _AddEstateFormsScreenState();
}

class _AddEstateFormsScreenState extends State<AddEstateFormsScreen> {
  EdgeInsets _margin = EdgeInsets.symmetric(
    horizontal: 30,
    vertical: 5,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: 15,
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              CustomButton(
                margin: _margin,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                title: AppStrings.addEstate,
                color: AppColors.primary(),
                fontSize: 20,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
