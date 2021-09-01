import 'package:flutter/material.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/phone.dart';
import 'package:saja/services/navigation/app_navigator.dart';
import 'package:saja/services/validation/regex_validator.dart';
import 'package:saja/widgets/custom_button.dart';
import 'package:saja/widgets/form_text_input.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final _inputMargin = EdgeInsets.symmetric(horizontal: 20);

  final _buttonMargin = EdgeInsets.symmetric(horizontal: 20);
  final _buttonPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 15);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      AppStrings.editProfile,
                      style: TextStyle(fontSize: 22),
                    ),
                    Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: AppColors.primary(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormTextInput(
                      label: AppStrings.fullName,
                      controller: nameController,
                      onChanged: (text) {},
                      validator: (value) {
                        if (!RegexValidator.validateName(value)) {
                          return AppStrings.invalidName;
                        }
                        return null;
                      },
                      margin: _inputMargin,
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
                      margin: _inputMargin,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: AppStrings.changePassword,
                      onPressed: () {
                        AppNavigator.pushReplacement(context, PhoneScreen());
                      },
                      fontSize: 20,
                      margin: _buttonMargin,
                      padding: _buttonPadding,
                      color: AppColors.primary(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: AppStrings.confirm,
                      onPressed: () {},
                      fontSize: 20,
                      margin: _buttonMargin,
                      padding: _buttonPadding,
                      color: AppColors.primary(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
