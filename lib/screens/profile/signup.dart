import 'package:flutter/material.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/services/snackbar/custom_snack_bar.dart';
import 'package:saja/services/user_services/primary_user_services.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_text_button.dart';
import 'package:saja/widgets/form_password_input.dart';
import 'package:saja/widgets/form_text_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                        AppStrings.signup,
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
                        FormTextInput(
                          inputType: TextInputType.number,
                          label: AppStrings.phone,
                          controller: phoneController,
                          onChanged: (text) {},
                          validator: (value) {
                            if (!RegexValidator.validatePhone(value)) {
                              return AppStrings.invalidPhone;
                            }
                            return null;
                          },
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FormPasswordInput(
                          label: AppStrings.password,
                          controller: passwordController,
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
                          height: 15,
                        ),
                        FormPasswordInput(
                          label: AppStrings.repeatPassword,
                          controller: repeatPasswordController,
                          onChanged: (text) {},
                          validator: (value) {
                            if (!RegexValidator.validatePassword(value)) {
                              return AppStrings.invalidPassword;
                            } else if (passwordController.value.text !=
                                repeatPasswordController.value.text) {
                              return AppStrings.repeadPassWrong;
                            } else {
                              return null;
                            }
                          },
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextButton(
                              title: AppStrings.forgotPassword,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          title: AppStrings.signupButtonText,
                          onPressed: onPress,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          fontSize: 20,
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          color: AppColors.primary(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppStrings.alreadyHaveAccount),
                            CustomTextButton(
                              title: AppStrings.login,
                              onPressed: () {
                                AppNavigator.popScreen(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPress() async {
    if (_formKey.currentState!.validate()) {
      {
        User user = User();
        user.mobile = phoneController.value.text;
        user.password = passwordController.value.text;
        await UserServices.signup(user: user);
      }
    }
  }
}