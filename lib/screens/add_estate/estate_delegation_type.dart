import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saja/models/estate/delegation_model.dart';
import 'package:saja/models/estate/estate_item.dart';
import 'package:saja/models/estate/estate_type_model.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/routes.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/estate/estate_services.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/services/snackbar/custom_snack_bar.dart';
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
  late Rxn<String?> assignmentType = Rxn();
  late Rxn<String?> estateTypeKey = Rxn();
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
  List<Widget> children2 = [];
  User user = User();
  List<AssignmentModel> delegationModels = [];
  List<EstateTypeModel> estateTypeModels = [];
  bool isInitialized = false;
  EstateItem estateItem = EstateItem();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: 15,
          ),
          padding: EdgeInsets.all(15),
          child: FutureBuilder(
              future: future().then((value) => true),
              builder: (context, snap) {
                if (snap.hasError || !snap.hasData) {
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
                  mainAxisAlignment: (MainAxisAlignment.spaceBetween),
                  children: [
                    for (Widget x in children2) x,
                    continueButton(),
                  ],
                );
              }),
        ),
      ),
    );
  }

  CustomButton continueButton() {
    return CustomButton(
      margin: _margin,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      title: AppStrings.nextStep,
      color: AppColors.primary(),
      fontSize: 20,
      icon: Icons.keyboard_arrow_left_sharp,
      iconPadding: 5,
      onPressed: () {
        onPress(estateItem: estateItem);
      },
    );
  }

  Future future() async {
    if (!isInitialized) {
      try {
        estateTypeModels =
            await EstateServices.getEstateType(token: user.token!)
                .catchError((e) async {
          throw e;
        });
        delegationModels = await EstateServices.getAssignmentType(
          token: user.token!,
        ).catchError((e) async {
          print(e);
          throw e;
        });
        List<String> assignmentListNames = [];
        List<String> estateTypelistNames = [];
        for (var element in delegationModels) {
          assignmentListNames.add(element.name);
        }
        for (var element in estateTypeModels) {
          estateTypelistNames.add(element.name!);
        }
        children2 = [
          Column(
            children: [
              Obx(() {
                return CustomDropDownButton(
                  AppStrings.delegationType,
                  // Constants.delegationTypeMap.entries.map((e) => e.key).toList(),
                  assignmentListNames,
                  dropDownValue: assignmentType.value,
                  onChange: (value) {
                    print(value);
                    assignmentType.value = value.toString();
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
                  estateTypelistNames,
                  dropDownValue: estateTypeKey.value,
                  onChange: (value) {
                    print(value);
                    estateTypeKey.value = value.toString();
                  },
                  hint: AppStrings.chooseAnOption,
                  textDirection: TextDirection.rtl,
                  margin: _margin,
                  padding: _padding,
                  titleMargin: _titleMargin,
                  titlePadding: _titlePadding,
                );
              }),
            ],
          ),
        ];
        isInitialized = true;
      } on Exception catch (e) {
        print(e);
        CustomSnackBar.showSnackbar(
            title: AppStrings.error, message: e.toString());
      }
    }
  }

  void onPress({required EstateItem estateItem}) {
    String? assignmentId;
    String? estateTypeId;
    print(assignmentType);
    if (assignmentType.value == null || estateTypeKey.value == null) {
      CustomSnackBar.showSnackbar(
          title: AppStrings.error, message: AppStrings.errorChoose);
    } else {
      for (var element in delegationModels) {
        if (element.name == assignmentType.value) {
          assignmentId = element.id;
          break;
        }
      }
      for (var element in estateTypeModels) {
        if (element.name == estateTypeKey.value) {
          estateTypeId = element.id;
        }
      }
      print(assignmentId);
      print(estateTypeId);
      estateItem.delegationType = assignmentType.value;
      estateItem.estateType = estateTypeKey.value;
      AppNavigator.pushScreen(RouteNames.ProvinceCity);
    }
  }
}
