import 'package:flutter/material.dart';
import 'package:saja/models/enums/login_status.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/routes.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/login/login_services.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_text_button.dart';
import 'package:saja/widgets/form_password_input.dart';
import 'package:saja/widgets/form_text_input.dart';

import '../../services/size/size_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;
  User user = User();

  late SizeConfig sizeConfig;
  @override
  Widget build(BuildContext context) {
    sizeConfig = SizeConfig(context);
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
                    FormTextInput(
                      label: AppStrings.phone,
                      inputType: TextInputType.number,
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
                      height: sizeConfig.height(7),
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
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextButton(
                          title: AppStrings.forgotPassword,
                          onPressed: () {
                            AppNavigator.pushScreen(RouteNames.forgetPass);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // signin button
                    CustomButton(
                      title: AppStrings.loginButtonText,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.stillNotSignedIn),
                        CustomTextButton(
                          title: AppStrings.signup,
                          onPressed: () {
                            AppNavigator.pushScreen(RouteNames.signup);
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

//? methods

  Future onPressed2() async {
    if (LoginServices.formValidator(formKey: _formKey)) {
      if (!loading) {
        loading = true;
        var result = await LoginServices.signinOptions(
            phoneController: phoneController,
            passwordController: passwordController,
            user: user);
        if (result) {
          await setToDatabase();
          // navigate to splash
        } else {
          loading = false;
        }
      }
    }
  }

  Future<void> setToDatabase() async {
    await LoginServices.setToDatabase(
        user: user, loginStatuses: LoginStatuses.loggedIn);
  }
}
