import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/other.dart';
import 'package:saja/resources/routes.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_dropdown.dart';

class ProvinceCityScreen extends StatefulWidget {
  const ProvinceCityScreen({Key? key}) : super(key: key);

  @override
  _ProvinceCityScreenState createState() => _ProvinceCityScreenState();
}

class _ProvinceCityScreenState extends State<ProvinceCityScreen> {
  var provincesMap = Constants.Provinces;
  var citiesMap = Constants.Cities;
  var provinceKey;
  var cityKey;
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
                    AppStrings.province,
                    provincesMap.entries.map((e) => e.key).toList(),
                    dropDownValue: provinceKey,
                    onChange: (value) {
                      setState(() {
                        provinceKey = value;
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
                    AppStrings.city,
                    getCitiesFromProvinces(),
                    dropDownValue: cityKey,
                    onChange: (value) {
                      setState(() {
                        cityKey = value;
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
                title: AppStrings.completeInfo,
                color: AppColors.primary(),
                fontSize: 20,
                icon: Icons.keyboard_arrow_left_sharp,
                iconPadding: 5,
                onPressed: () {
                  AppNavigator.pushScreen(RouteNames.addEstateForms);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> getCitiesFromProvinces() {
    List<String> cities = citiesMap.entries.map((e) => e.key).toList();
    if (provinceKey != null) {
      int provinceId = provincesMap[provinceKey] ?? 0;
      if (provinceId != 0) {
        if (citiesMap.containsValue(provinceId)) {
          return citiesMap.entries
              .where((element) => element.value == provinceId)
              .map((e) => e.key)
              .toList();
        }
      }
    }
    return cities;
  }
}
