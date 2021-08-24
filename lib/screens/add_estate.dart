import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/widgets/custom_button.dart';

class AddEstateScreen extends StatelessWidget {
  const AddEstateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 150,
                filterQuality: FilterQuality.high,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppStrings.saja,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppStrings.loginBeforeAddEstate,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          CustomButton(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            title: AppStrings.addEstate,
            color: AppColors.primary(),
            fontSize: 20,
            icon: Icons.keyboard_arrow_left_sharp,
            iconPadding: 5,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
