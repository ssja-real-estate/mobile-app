import 'package:saja/models/user_model.dart';
import 'package:saja/services/api/api.dart';
import '../../resources/api.dart';
import '../../resources/strings.dart';
import '../snackbar/custom_snack_bar.dart';

class UserServices {
  //? signup user
  static Future<bool> signup({required User user}) async {
    try {
      bool result =
          await Api.post(json: user.toJson(), unicode: ApiStrings.signupAddress)
              .then((data) {
        CustomSnackBar.showSnackbar(title: "", message: data);
        return true;
      }).catchError((error) {
        CustomSnackBar.showSnackbar(title: AppStrings.error, message: error);
        return false;
      });
      return result;
    } catch (e) {
      CustomSnackBar.showSnackbar(
          title: AppStrings.error, message: ApiStrings.apiError);
      return false;
    }
  }

  //? signin user
  static Future<bool> signin({required User user}) async {
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
      CustomSnackBar.showSnackbar(
          title: AppStrings.error, message: ApiStrings.apiError);
      result = false;
    }
    return result;
  }

  //? forgetPass
  static Future<bool> forgotPassword({required User user}) async {
    var result = await Api.post(
            json: '',
            unicode: ApiStrings.forgetPsswordAddress,
            queryNotMap: user.mobile!)
        .then((value) async {
      CustomSnackBar.showSnackbar(title: "", message: value.toString());
      return true;
    }).catchError((error) {
      CustomSnackBar.showSnackbar(
          title: AppStrings.error, message: error.toString());
      return false;
    });

    return result;
  }

  //? verify
  static Future<bool> verify(
      {required String smsCode, required User user}) async {
    try {
      var result = await Api.getVerify(
              val: {ApiStrings.code: smsCode, ApiStrings.mobile: user.mobile},
              unicode: ApiStrings.verifyAddress)
          .then((value) {
        CustomSnackBar.showSnackbar(title: value);
      }).catchError((error) {
        CustomSnackBar.showSnackbar(title: error);
      });
      return result;
    } catch (e) {
      CustomSnackBar.showSnackbar(
          title: AppStrings.error, message: ApiStrings.noInternet);
      return false;
    }
  }

  //? update name
  static Future updateName() async {}

  //? logout
  static Future logout() async {}
}
