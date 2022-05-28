import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saja/resources/map.dart';
import 'package:saja/services/permissions/permission_services.dart';

class MapGeolocatorService {
  static Future<bool> checkPermission(
      {required PermissionWithService locationPermission}) async {
    print("start checking permmision");
    PermissionStatus status = await PermissionServices.permisionStatus(
        permission: locationPermission);

    if (status.isDenied) return false;

    if (status.isPermanentlyDenied) {
      throw MapResources.permanentlyDenied;
    }
    return true;
  }

  static Future<Position> getCurrentPosition(
      {required GeolocatorPlatform geolocatorPlatform}) async {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.medium,
    );
    // return await Geolocator.getCurrentPosition(
    //     forceAndroidLocationManager: true);
    return await geolocatorPlatform.getCurrentPosition(
        locationSettings: locationSettings);
  }

  static Future<bool> requestPermission(
      {required PermissionWithService locationPermission}) async {
    var result =
        await PermissionServices.setPermission(permission: locationPermission);
    return result.isGranted;
  }
}
