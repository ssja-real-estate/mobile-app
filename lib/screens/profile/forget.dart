import 'package:flutter/material.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/user_services/primary_user_services.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/form_text_input.dart';
import 'package:saja/services/utility/string_extensions.dart';


// ignore: must_be_immutable
class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({Key? key}) : super(key: key);
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(
            top: 30,
          ),
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
                      AppStrings.forget,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: Form(
                      key: _formKey,
                      child: Column(children: [
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
                      ]))),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                title: AppStrings.forget,
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
            ],
          )),
        ),
      ),
    );
  }

  void onPress() async {
    if (!loading) {
      loading = true;
      if (_formKey.currentState!.validate()) {
        {
          
          User user = User();
          user.mobile = phoneController.value.text.convertToEnglish();
          bool result = await UserServices.forgotPassword(user: user);
          if (!result) {
            loading = false;
          } else {
            // go to new password screeen
          }
        }
      } else {
        loading = false;
      }
    }
  }
}
