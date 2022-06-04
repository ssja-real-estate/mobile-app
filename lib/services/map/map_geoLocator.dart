import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as permission;
import 'package:saja/resources/map.dart';
import 'package:saja/services/permissions/permission_services.dart';

class MapGeolocatorService {
  static Future<bool> checkPermission(
      {required permission.PermissionWithService locationPermission}) async {
    print("start checking permmision");
    permission.PermissionStatus status =
        await PermissionServices.permisionStatus(
            permission: locationPermission);

    if (status.isDenied) return false;

    if (status.isPermanentlyDenied) {
      throw MapResources.permanentlyDenied;
    }
    return true;
  }

  static Future<Position> getCurrentPosition(
      {required bool forceAndroidLocationManager}) async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        timeLimit: Duration(minutes: 1, seconds: 20),
        forceAndroidLocationManager: forceAndroidLocationManager);
  }

  static Future<bool> requestPermission(
      {required permission.PermissionWithService locationPermission}) async {
    var result =
        await PermissionServices.setPermission(permission: locationPermission);
    return result.isGranted;
  }
}
