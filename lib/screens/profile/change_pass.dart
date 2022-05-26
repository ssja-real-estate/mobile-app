import 'package:flutter/material.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/size/size_config.dart';
import 'package:saja/services/utility/string_extensions.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/form_password_input.dart';

// ignore: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final currenPpasswordController = TextEditingController();
  final newPpasswordController = TextEditingController();
  bool loading = false;
  User user = User();

  late SizeConfig sizeConfig;
  @override
  Widget build(BuildContext context) {
    sizeConfig = SizeConfig(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                ),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 100,
                      filterQuality: FilterQuality.high,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      AppStrings.userChangePassword,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormPasswordInput(
                        label: AppStrings.oldPassword,
                        controller: currenPpasswordController,
                        onChanged: (text) {},
                        validator: (value) {
                          if (!RegexValidator.validatePassword(value)) {
                            return AppStrings.invalidPassword;
                          } else {
                            return null;
                          }
                        },
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      ),

                      SizedBox(
                        height: sizeConfig.height(7),
                      ),
                      FormPasswordInput(
                        label: AppStrings.newPassword,
                        controller: newPpasswordController,
                        onChanged: (text) {},
                        validator: (value) {
                          if (!RegexValidator.validatePassword(value)) {
                            return AppStrings.invalidPassword;
                          } else {
                            return null;
                          }
                        },
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      // signin button
                      CustomButton(
                        title: AppStrings.changePassword,
                        onPressed: onPressed2,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        fontSize: 20,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        color: AppColors.primary(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onPressed2() async {
    if (_formKey.currentState!.validate()) {
      {
        if (!loading) {
          loading = true;
          User user = User();
          user.mobile!.convertToEnglish();
          currenPpasswordController.text.toString().convertToEnglish();
          newPpasswordController.text.toString().convertToEnglish();
          // bool result = await UserServices.changePassword(
          //     user: user,
          //     currentPassword: currenPpasswordController.text.toString(),
          //     newPassword: newPpasswordController.text.toString());
          // if (result) {
          // } else {
          //   loading = false;
          // }
        }
      }
    }
  }
}
