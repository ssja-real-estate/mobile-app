import 'package:flutter/material.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/asset_addresses.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/routes.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/services/snackbar/custom_snack_bar.dart';
import 'package:saja/widgets/custom_button.dart';

class AddEstateIntroductionScreen extends StatelessWidget {
  AddEstateIntroductionScreen({Key? key}) : super(key: key);
  User user = User();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(AppAssetAddress.logoAddress),
            width: 150,
            filterQuality: FilterQuality.high,
          ),
          Column(
            children: [
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
            onPressed: onPress,
          )
        ],
      ),
    );
  }

  void onPress() {
    if (user.token == null || user.token == "") {
      CustomSnackBar.showSnackbar(
          title: AppStrings.error, message: AppStrings.errorSignIn);
      AppNavigator.offAll(RouteNames.mainAppProfile);
    } else {
      AppNavigator.pushScreen(RouteNames.estateDelegationType);
    }
  }
}
