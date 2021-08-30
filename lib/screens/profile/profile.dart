import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/utility/string_extensions.dart';
import 'package:saja/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var name = "کریم باقری";
  var phone = "+09123456789";

  final _buttonMargin = EdgeInsets.symmetric(horizontal: 20);
  final _buttonPadding = EdgeInsets.symmetric(vertical: 15, horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    phone.convertToPersian(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.primary(),
              indent: 10,
              endIndent: 10,
              thickness: 1,
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              title: AppStrings.editProfile,
              onPressed: () {},
              padding: _buttonPadding,
              fontSize: 20,
              margin: _buttonMargin,
              textColor: AppColors.primary(),
              border: Border.all(color: AppColors.primary()),
              color: AppColors.white(),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              title: AppStrings.submittedEstates,
              onPressed: () {},
              padding: _buttonPadding,
              fontSize: 20,
              margin: _buttonMargin,
              textColor: AppColors.primary(),
              border: Border.all(color: AppColors.primary()),
              color: AppColors.white(),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              title: AppStrings.estatesToBeSubmitted,
              onPressed: () {},
              padding: _buttonPadding,
              fontSize: 20,
              margin: _buttonMargin,
              textColor: AppColors.primary(),
              border: Border.all(color: AppColors.primary()),
              color: AppColors.white(),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              title: AppStrings.logout,
              onPressed: () {},
              padding: _buttonPadding,
              fontSize: 20,
              margin: _buttonMargin,
              textColor: AppColors.red(),
              border: Border.all(color: AppColors.red()),
              color: AppColors.white(),
              icon: Icons.logout_rounded,
              iconPadding: 10,
              iconColor: AppColors.red(),
            ),
          ],
        ),
      ),
    );
  }
}
