import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/resources/asset_addresses.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/database/hive_services.dart';
import 'package:saja/services/map/map_geoLocator.dart';
import 'package:saja/services/snackbar/custom_snack_bar.dart';

class MapServices {
  static void showError({required String errorMassage}) {
    CustomSnackBar.showSnackbar(title: AppStrings.error, message: errorMassage);
  }

  static Future<Position> getCurrentLocation(
      {required bool forceAndroidLocationManager}) async {
    var position = await MapGeolocatorService.getCurrentPosition(
            forceAndroidLocationManager: forceAndroidLocationManager)
        .timeout(Duration(minutes: 1, seconds: 20));
    return position;
  }

  static Future<bool> getStatus(
      PermissionWithService locationPermission) async {
    bool status = await MapGeolocatorService.checkPermission(
        locationPermission: locationPermission);
    return status;
  }

  static Marker customMarker({required LatLng latLng}) {
    return Marker(
      width: 40.0,
      height: 40.0,
      point: latLng,
      builder: (ctx) => InkWell(
        child: Image.asset(AppAssetAddress.mapMarkerAddress),
        onTap: () {},
      ),
    );
  }

  static Future<LatLng> getLastPosition() async {
    Box latLngBox =
        await HiveDatabase.openBox(boxName: DatabaseStrings.latLngBox);
    LatLng latLng = await HiveServices.getLastLatLngPosition(box: latLngBox);
    return latLng;
  }

  static Future<bool> setStatus(
      PermissionWithService locationPermission) async {
    return await MapGeolocatorService.requestPermission(
        locationPermission: locationPermission);
  }
}
