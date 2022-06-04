import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saja/resources/map.dart';
import 'package:saja/services/map/map_services.dart';

class GpsWidget extends StatelessWidget {
  GpsWidget({
    Key? key,
    required this.mapControllerImpl,
    required this.getAndchangeLocation,
    required this.lastLatLng,
  }) : super(key: key);
  Function() getAndchangeLocation;

  final MapControllerImpl mapControllerImpl;
  Rx<IconData> gpsIcon = MapIcons.gpsIcon.obs;
  LatLng lastLatLng;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: EdgeInsets.only(bottom: 20, right: 10),
          child: IconButton(
              iconSize: 50,
              onPressed: gpsLocate,
              icon: Obx(() => Icon(gpsIcon.value))),
        ));
  }

  void changeGpsIcon({required IconData icon}) {
    gpsIcon.value = icon;
  }

  void falseOrCatchMethod({required String errorMessage}) {
    MapServices.showError(errorMassage: errorMessage);
    changeGpsIcon(icon: MapIcons.gpsIcon);
    loading = false;
  }

  Future<void> gpsLocate() async {
    if (!loading) {
      bool changing = false;
      Timer chngGpsIcon = Timer.periodic(Duration(seconds: 2), (t) {
        changing = !changing;
        changing
            ? changeGpsIcon(icon: MapIcons.gpsIconTracking)
            : changeGpsIcon(icon: MapIcons.gpsIcon);
      });
      loading = true;
      try {
        changeGpsIcon(icon: MapIcons.gpsIconTracking);
        var locationPermission = Permission.location;
        bool status = await MapServices.getStatus(locationPermission);
        var locationPermission2 = Permission.locationAlways;
        bool status2 = await MapServices.getStatus(locationPermission2);
        var locationPermission3 = Permission.locationWhenInUse;
        bool status3 = await MapServices.getStatus(locationPermission3);

        if (!status || !status2 || !status3) {
          print("no service");
          bool setStatus = await MapServices.setStatus(locationPermission);
          bool setStatus2 = await MapServices.setStatus(locationPermission2);
          bool setStatus3 = await MapServices.setStatus(locationPermission3);
          if (!setStatus || !setStatus2 || !setStatus3) {
            falseOrCatchMethod(errorMessage: MapResources.noGpsService);
          } else {
            loading = false;
            await gpsLocate();
          }
        } else {
          try {
            print("have service");
            await getAndchangeLocation();
            loading = false;
            chngGpsIcon.cancel();
          } on Exception catch (e) {
            chngGpsIcon.cancel();
            falseOrCatchMethod(errorMessage: MapResources.errorTracking);
            print('e is');
            printError(info: e.toString());
            loading = false;
          }
        }
        chngGpsIcon.cancel();
        changeGpsIcon(icon: MapIcons.gpsIcon);
      } catch (e) {
        // TODO
        chngGpsIcon.cancel();
        changeGpsIcon(icon: MapIcons.gpsIcon);
        loading = false;
        print(e);
      }
      chngGpsIcon.cancel();
      changeGpsIcon(icon: MapIcons.gpsIcon);
      loading = false;
    }
  }
}
