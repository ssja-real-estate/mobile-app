import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/signup.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_text_button.dart';
import 'package:saja/widgets/password_input_form_field.dart';
import 'package:saja/widgets/text_input_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    AppStrings.login,
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
                    TextInputFormField(
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
                      height: 20,
                    ),
                    PasswordInputFormField(
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
                      height: 5,
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
                      title: AppStrings.loginButtonText,
                      onPressed: () {},
                      horizontalPadding: 20,
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
                        Text(AppStrings.stillNotSignedIn),
                        CustomTextButton(
                          title: AppStrings.signup,
                          onPressed: () {
                            AppNavigator.pushScreen(context, SignupScreen());
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
    );
  }
}
