import 'package:permission_handler/permission_handler.dart';
import 'package:saja/models/enums/permision_type.dart';

class PermissionServices {
  static Future<PermissionStatus> permisionStatus(
      {required PermissionWithService  permission}) async {
        
   return await permission.status;
  }
  static Future<PermissionStatus> setPermission(  {required PermissionWithService  permission})async{
      return await permission.request();
  }
}
