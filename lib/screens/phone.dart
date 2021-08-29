import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/code_verification.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/form_text_input.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

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
                        AppStrings.enterPhone,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormTextInput(
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: AppStrings.receiveCode,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        print('invalid');
                      } else {
                        AppNavigator.pushReplacement(
                          context,
                          CodeVerificationScreen(),
                        );
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
