// ignore_for_file: avoid_print, must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/map_type.dart';
import 'package:saja/resources/asset_addresses.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/map.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/map/choose_screen.dart';
import 'package:saja/screens/map/custom_tile.dart';
import 'package:saja/screens/map/gps.dart';
import 'package:saja/services/map/map_services.dart';
import 'package:saja/widgets/custom_text_button.dart';

class MapScreeenTest extends StatelessWidget {
  MapScreeenTest({Key? key, required this.mapType}) : super(key: key);
  MapType mapType;
  MapControllerImpl mapControllerImpl = MapControllerImpl();

  late Rxn<MapOptions> mapOptions = Rxn();
  late Rx<Marker> markers;
  late LatLng lastLatLng;
  // final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  late Future future;
  bool loading = false;
  void move({required LatLng lastLatLng}) {
    mapControllerImpl.move(lastLatLng, 17);
    markers.value = MapServices.customMarker(latLng: lastLatLng);
    gpsIcon.value = MapIcons.gpsIcon;
  }

  MapController mapController = MapController();
  Rx<IconData> gpsIcon = MapIcons.gpsIcon.obs;
  @override
  Widget build(BuildContext context) {
    future = initialOptions();
    // initialOptions();

    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomTextButton(
            title: AppStrings.ok,
            color: AppColors.white(),
          )
        ],
      ),
      body: FutureBuilder(
          future: future.then((value) => value),
          builder: (context, snap) {
            if (snap.hasError || !snap.hasData) {
              return (Center(
                child: CircularProgressIndicator(
                  color: AppColors.accent(),
                ),
              ));
            }

            return Stack(
              children: [
                ChooseWidget(
                    mapControllerImpl: mapControllerImpl,
                    markers: markers,
                    mapOptions: mapOptions),
                GpsWidget(
                  mapControllerImpl: mapControllerImpl,
                  getAndchangeLocation: getAndchangeLocation,
                  lastLatLng: lastLatLng,
                )
              ],
            );
          }),
    );
  }

  Future<void> getAndchangeLocation() async {
    print("get location map-test started");
    late Position position;
    try {
      position = await MapServices.getCurrentLocation(
          forceAndroidLocationManager: false);
    } catch (e) {
      print("e in get and change location started map test");
      position = await MapServices.getCurrentLocation(
          forceAndroidLocationManager: true);
    }
    changeLastLatLng(position);
    move(lastLatLng: lastLatLng);
  }

  void changeLastLatLng(Position position) {
    print(position);
    lastLatLng.latitude = position.latitude;
    lastLatLng.longitude = position.longitude;
  }

  // main
  Future initialOptions() async {
    lastLatLng = await MapServices.getLastPosition();
    markerInitialize(latLng: lastLatLng);
    await HiveDatabase.close();
    mapOptions = await mapOptionsInitialize(latLng: lastLatLng);
    return true;
  }

// main
  Future<Rxn<MapOptions>> mapOptionsInitialize({required LatLng latLng}) async {
    var onLongPress = (x, lng) {
      markers.value = (MapServices.customMarker(latLng: lng));
    };
    return Rxn(
        MapOptions(center: latLng, zoom: 14.0, onLongPress: onLongPress));
  }

// main
  void markerInitialize({required LatLng latLng}) {
    markers = Rx(MapServices.customMarker(latLng: latLng));
  }
}
