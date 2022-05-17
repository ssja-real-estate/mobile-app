import 'package:hive/hive.dart';
import 'package:saja/database/hive/hive.dart';
import 'package:saja/models/user_model.dart';
import 'package:saja/resources/api.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/resources/strings.dart';

class HiveServices {
  static Future putUserToHive({required User user, required Box box}) async {
    await HiveDatabese.put(
        box: box, key: ApiStrings.id, value: user.id.toString());
    await HiveDatabese.put(
        box: box, key: ApiStrings.name, value: user.name.toString());
    await HiveDatabese.put(
        box: box, key: ApiStrings.mobile, value: user.mobile.toString());
    await HiveDatabese.put(
        box: box, key: ApiStrings.password, value: user.password.toString());
    await HiveDatabese.put(
        box: box, key: ApiStrings.role, value: user.role.toString());
    await HiveDatabese.put(
        box: box, key: ApiStrings.token, value: user.token.toString());
  }

  static Future putHiveToUser({required Box box, required User user}) async {
    user.id = await HiveDatabese.get(box: box, key: ApiStrings.id);
    user.name = await HiveDatabese.get(box: box, key: ApiStrings.name);
    user.mobile = await HiveDatabese.get(box: box, key: ApiStrings.mobile);
    user.password = await HiveDatabese.get(box: box, key: ApiStrings.password);
    user.role =
        int.parse(await HiveDatabese.get(box: box, key: ApiStrings.role));
    user.token = await HiveDatabese.get(box: box, key: ApiStrings.token);
  }

  static Future getLoginStatus({required Box box}) async {
    var result = await HiveDatabese.get(box: box, key: DatabaseStrings.isLogin);
    if (result == null ||
        result == "false" ||
        result.length == 0 ||
        result == "0") return false;
    return true;
  }
}
