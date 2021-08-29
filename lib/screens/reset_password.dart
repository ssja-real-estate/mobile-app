import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/form_password_input.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Text(
                        AppStrings.resetPassword,
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormPasswordInput(
                        label: AppStrings.newPassword,
                        controller: passwordController,
                        onChanged: (text) {
                          print(passwordController.text);
                        },
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
                        height: 20,
                      ),
                      FormPasswordInput(
                        label: AppStrings.repeatNewPassword,
                        controller: repeatPasswordController,
                        onChanged: (text) {
                          print(repeatPasswordController.text);
                        },
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
                    ],
                  ),
                  CustomButton(
                    title: AppStrings.confirm,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        if (passwordController.text !=
                            repeatPasswordController.text) {
                          print('invalid');
                        }
                      } else {
                        AppNavigator.popScreen(context);
                      }
                    },
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    fontSize: 20,
                    color: AppColors.primary(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
