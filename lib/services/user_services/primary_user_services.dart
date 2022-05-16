import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/services/api/api.dart';
import 'package:saja/widgets/custom_text_button.dart';

import '../../resources/api.dart';
import '../../resources/strings.dart';
import '../snackbar/custom_snack_bar.dart';

class UserServices {
  //? signup user
  static Future signup({required User user}) async {
    try {
      await Api.post(
              json: user.signUptoJson(), unicode: ApiStrings.signupAddress)
          .then((data) {
        // do something
        print("data in then is :" + data);
        // Get.off(()=> VerifySms());
      }).catchError((error) {
        print("we have an error in user model signup future");

        CustomSnackBar.showSnackbar(title: AppStrings.error, message: error);
        print(error);
      });
    } catch (e) {
      print("we have an error in user model signup try-catch");
      print(e);
    }
  }

  //? signin user
  static Future signin({required User user}) async {
    print("signin started");
    bool result;
    try {
      result = await Api.post(
              json: user.signUptoJson(), unicode: ApiStrings.signinAddress)
          .then((data) {
        user.id = data[ApiStrings.user][ApiStrings.id];
        user.token = data[ApiStrings.token];
        user.name = data[ApiStrings.user][ApiStrings.name];
        user.role = data[ApiStrings.user][ApiStrings.role];

        //? Get.off(()=> VerifySms());

        return true;
      }).catchError((error) {
        print("we have an error in user model signin future");
        CustomSnackBar.showSnackbar(title: AppStrings.error, message: error);

        print(error);
        return false;
      });
    } catch (e) {
      print("we have an error in user model signin try-catch");
      print(e);
      result = false;
    }
    print("signin ended");
    return result;
  }

  //? verify
  static Future verify({required String smsCode, required User user}) async {
    try {
      var result = await Api.getVerify(
              val: {ApiStrings.code: smsCode, ApiStrings.mobile: user.mobile},
              unicode: ApiStrings.verifyAddress)
          .then((value) {})
          .catchError((error) {
        print("we have an error in user model verify future");
        print(error);
      });
    } catch (e) {
      print("we have an error in user model verify try-catch");
      print(e);
    }
  }

  //? forgetPass
  static Future forgotPassword() async {}

  //? update name
  static Future updateName() async {}

  //? logout
  static Future logout() async {}
}
