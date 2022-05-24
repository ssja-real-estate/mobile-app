import 'package:hive/hive.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/services/api/api.dart';
import '../../resources/api.dart';
import '../../resources/strings.dart';
import '../snackbar/custom_snack_bar.dart';

class UserServices {
  //? signup user
  static Future signup({required User user}) async {
    await Api.post(json: user.toJson(), unicode: ApiStrings.signupAddress)
        .then((data) {
      CustomSnackBar.showSnackbar(title: "", message: data);
      //? Get.off(()=> VerifySms());
    }).catchError((error) {
      CustomSnackBar.showSnackbar(title: AppStrings.error, message: error);
    });
  }

  //? signin user
  static Future signin({required User user}) async {
    bool result;
    try {
      result =
          await Api.post(json: user.toJson(), unicode: ApiStrings.signinAddress)
              .then((data) async {
        user.id = data[ApiStrings.user][ApiStrings.id];
        user.token = data[ApiStrings.token];
        user.name = data[ApiStrings.user][ApiStrings.name];
        user.role = data[ApiStrings.user][ApiStrings.role];

        return true;
      }).catchError((error) {
        CustomSnackBar.showSnackbar(title: AppStrings.error, message: error);
        return false;
      });
    } catch (e) {
      result = false;
    }
    return result;
  }

//? forget passord
  static Future forgetPass({required String mobile}) async {}

  //? verify
  static Future verify({required String smsCode, required User user}) async {
    try {
      var result = await Api.getVerify(
              val: {ApiStrings.code: smsCode, ApiStrings.mobile: user.mobile},
              unicode: ApiStrings.verifyAddress)
          .then((value) {})
          .catchError((error) {});
    } catch (e) {}
  }

  //? forgetPass
  static Future forgotPassword({required User user}) async {
    await Api.post(json: user.mobile!, unicode: ApiStrings.forgetPssword).then((value) => {
      
    });
  }

  //? update name
  static Future updateName() async {}

  //? logout
  static Future logout() async {}
}
