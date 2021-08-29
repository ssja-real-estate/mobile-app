import 'package:flutter/material.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/custom_text_button.dart';
import 'package:saja/widgets/form_text_input.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  _CodeVerificationScreenState createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Text(
                        AppStrings.enterCode,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormTextInput(
                        label: AppStrings.verificationCode,
                        controller: codeController,
                        inputType: TextInputType.number,
                        onChanged: (text) {},
                        validator: (value) {
                          if (!RegexValidator.validateVerificationCode(value)) {
                            return AppStrings.invalidCode;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextButton(
                        title: AppStrings.resendCode,
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: AppStrings.nextStep,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        print('invalid');
                      } else {}
                    },
                    fontSize: 20,
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
