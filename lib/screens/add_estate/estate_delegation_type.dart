import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/other.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/add_estate/province_city.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_dropdown.dart';

class EstateDelegationTypeScreen extends StatefulWidget {
  const EstateDelegationTypeScreen({Key? key}) : super(key: key);

  @override
  _EstateDelegationTypeScreenState createState() =>
      _EstateDelegationTypeScreenState();
}

class _EstateDelegationTypeScreenState
    extends State<EstateDelegationTypeScreen> {
  var delegationTypeKey;
  var estateTypeKey;
  EdgeInsets _margin = EdgeInsets.symmetric(
    horizontal: 30,
    vertical: 5,
  );
  EdgeInsets _padding = EdgeInsets.only(left: 5, right: 10);
  EdgeInsets _titleMargin = EdgeInsets.only(
    right: 25,
    top: 10,
  );
  EdgeInsets _titlePadding = EdgeInsets.only(left: 5, right: 10);

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomDropDownButton(
                    AppStrings.delegationType,
                    Constants.delegationTypeMap.entries
                        .map((e) => e.key)
                        .toList(),
                    dropDownValue: delegationTypeKey,
                    onChange: (value) {
                      setState(() {
                        delegationTypeKey = value;
                      });
                    },
                    hint: AppStrings.chooseAnOption,
                    textDirection: TextDirection.rtl,
                    margin: _margin,
                    padding: _padding,
                    titleMargin: _titleMargin,
                    titlePadding: _titlePadding,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomDropDownButton(
                    AppStrings.estateType,
                    Constants.estateTypeMap.entries.map((e) => e.key).toList(),
                    dropDownValue: estateTypeKey,
                    onChange: (value) {
                      setState(() {
                        estateTypeKey = value;
                      });
                    },
                    hint: AppStrings.chooseAnOption,
                    textDirection: TextDirection.rtl,
                    margin: _margin,
                    padding: _padding,
                    titleMargin: _titleMargin,
                    titlePadding: _titlePadding,
                  ),
                ],
              ),
              CustomButton(
                margin: _margin,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                title: AppStrings.nextStep,
                color: AppColors.primary(),
                fontSize: 20,
                icon: Icons.keyboard_arrow_left_sharp,
                iconPadding: 5,
                onPressed: () {
                  AppNavigator.pushScreen(context, ProvinceCityScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
