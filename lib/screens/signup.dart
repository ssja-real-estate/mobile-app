import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_text_button.dart';
import 'package:saja/widgets/password_input_form_field.dart';
import 'package:saja/widgets/text_input_form_field.dart';

class SignupScreen extends StatefulWidget {
  static const valueKey = ValueKey('Signup');
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
                    Strings.signup,
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
                      label: Strings.phone,
                      controller: phoneController,
                      onChanged: (text) {},
                      validator: (value) {
                        if (!RegexValidator.validatePhone(value)) {
                          return Strings.invalidPhone;
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
                      label: Strings.password,
                      controller: passwordController,
                      onChanged: (text) {},
                      validator: (value) {
                        if (!RegexValidator.validatePassword(value)) {
                          return Strings.invalidPassword;
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
                    PasswordInputFormField(
                      label: Strings.repeatPassword,
                      controller: repeatPasswordController,
                      onChanged: (text) {},
                      validator: (value) {
                        if (!RegexValidator.validatePassword(value)) {
                          return Strings.invalidPassword;
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
                          title: Strings.forgotPassword,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      title: Strings.signupButtonText,
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
                        Text(Strings.alreadyHaveAccount),
                        CustomTextButton(
                          title: Strings.login,
                          onPressed: () {},
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
