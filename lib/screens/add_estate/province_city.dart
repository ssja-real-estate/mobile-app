import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saja/models/estate/city_model.dart';
import 'package:saja/models/estate/estate_item.dart';
import 'package:saja/models/estate/province_model.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/Estate.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/other.dart';
import 'package:saja/resources/routes.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/estate/estate_services.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/services/snackbar/custom_snack_bar.dart';
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
  late Rxn<String?> provinceKey = Rxn();
  late Rxn<String?> cityKey = Rxn();
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
  bool isProvinceInitialized = false;
  bool isInitialized = false;
  bool isCityInitialized = false;
  User user = User();
  List<Widget> children2 = [];
  List<ProvinceModel> provinceModels = [];
  List<CityModel> cityModels = [];
  List<String> provinceListNames = [];
  Rxn<List<String>> cityListNames = Rxn([]);
  Widget? provinceWidget;
  late Rxn<Future> cfuture = Rxn();
  EstateItem estateItem = EstateItem();
  @override
  Widget build(BuildContext context) {
    // futureProvince();
    cfuture.value = future();
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: 15,
          ),
          padding: EdgeInsets.all(15),
          child: Obx(() {
            return FutureBuilder(
                future: cfuture.value!.then((value) => value).catchError((e) {
                  CustomSnackBar.showSnackbar(
                      title: AppStrings.error, message: e.toString());
                  Future.delayed(Duration(seconds: 3), () {
                    cfuture.value = future();
                  });
                  return false;
                }),
                builder: (context, snap) {
                  if (snap.hasError || !snap.hasData || snap.data == false) {
                    return Column(
                      mainAxisAlignment: (MainAxisAlignment.spaceBetween),
                      children: [
                        Container(
                          height: 500,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        continueButton(),
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (Widget x in children2) x,
                      SizedBox(height: 15),
                      continueButton()
                    ],
                  );
                });
          }),
        ),
      ),
    );
  }

  CustomButton continueButton() {
    return CustomButton(
      margin: _margin,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      title: AppStrings.completeInfo,
      color: AppColors.primary(),
      fontSize: 20,
      icon: Icons.keyboard_arrow_left_sharp,
      iconPadding: 5,
      onPressed: () {
        onPress(estateItem: estateItem);
      },
    );
  }

  void onPress({required EstateItem estateItem}) {
    if (cityKey.value != null && provinceKey.value != null) {
      addToEstate(estateItem: estateItem);
      AppNavigator.pushScreen(RouteNames.addEstateForms);
    } else {
      CustomSnackBar.showSnackbar(
          title: AppStrings.error, message: AppStrings.errorChoose);
    }
  }

  void getCitiesFromProvinces() {
    if (provinceKey.value != null && provinceKey.value.toString().length != 0) {
      bool isNotAvailable = true;
      for (var element in provinceModels) {
        if (element.name == provinceKey.value) {
          isNotAvailable = false;
          cityModels = [];
          cityListNames.value = [];
          for (var cityElement in element.cities) {
            cityModels.add(CityModel.fromMap(map: cityElement));
          }
          for (var element2 in cityModels) {
            cityListNames.value!.add(element2.name);
          }
          break;
        }
      }
      if (isNotAvailable) {
        throw EstateStrings.noCityError;
      }
    }
  }

  Future future() async {
    if (!isInitialized) {
      cityModels = [];
      cityListNames.value = [];
      try {
        provinceModels =
            await EstateServices.getProvince(token: user.token!.toString())
                .catchError((e) async {
          throw e;
        });
        for (var element in provinceModels) {
          provinceListNames.add(element.name);
        }
        children2 = [
          Column(
            children: [
              Obx(() {
                return CustomDropDownButton(
                  AppStrings.delegationType,
                  // Constants.delegationTypeMap.entries.map((e) => e.key).toList(),
                  provinceListNames,
                  dropDownValue: provinceKey.value,
                  onChange: (value) {
                    provinceKey.value = value.toString();
                    cityListNames.value = [];
                    cityModels = [];
                    cityKey.value = null;
                    getCitiesFromProvinces();
                  },
                  hint: AppStrings.chooseAnOption,
                  textDirection: TextDirection.rtl,
                  margin: _margin,
                  padding: _padding,
                  titleMargin: _titleMargin,
                  titlePadding: _titlePadding,
                );
              }),
              SizedBox(
                height: 15,
              ),
              Obx(() {
                return CustomDropDownButton(
                  AppStrings.estateType,
                  cityListNames.value!,
                  dropDownValue: cityKey.value,
                  onChange: (value) {
                    cityKey.value = value.toString();
                  },
                  hint: AppStrings.chooseAnOption,
                  textDirection: TextDirection.rtl,
                  margin: _margin,
                  padding: _padding,
                  titleMargin: _titleMargin,
                  titlePadding: _titlePadding,
                );
              }),
              IconButton(
                  onPressed: () {
                    AppNavigator.pushScreen(RouteNames.mapAdd);
                  },
                  icon: Icon(Icons.map)),
            ],
          ),
        ];
        isInitialized = true;
        return true;
      } catch (e) {
        rethrow;
      }
    }
  }

  void addToEstate({required EstateItem estateItem}) {
    for (var element in provinceModels) {
      if (provinceKey.value == element.name) {
        estateItem.provinceModel = element;
        break;
      }
    }
    for (var element in cityModels) {
      if (cityKey.value == element.name) {
        estateItem.cityModel = element;
        break;
      }
    }
  }
}
