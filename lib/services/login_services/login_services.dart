import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/login_status.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/services/database/hive_services.dart';
import 'package:saja/services/user_services/primary_user_services.dart';

class LoginServices{
  static formValidator({required GlobalKey<FormState> formKey}){
    return formKey.currentState!.validate();

  }
  static Future<bool> signinOptions({required TextEditingController phoneController,required TextEditingController passwordController,required User user} ) async {
 user.mobile = phoneController.text;
        user.password = passwordController.text;
        return await UserServices.signin(user: user);

  }
  static Future setToDatabase({required User user,required LoginStatuses loginStatuses})async{
 Box box = await HiveDatabase.openBox(boxName: DatabaseStrings.userBox);
    await HiveServices.userToDatabase(userJson: user.toJson(), box: box);
    box = await HiveDatabase.openBox(boxName: DatabaseStrings.loginBox);
    await HiveServices.loginSetStatus(
        loginBox: box, status: loginStatuses.name);
    await HiveDatabase.close();
  }
}