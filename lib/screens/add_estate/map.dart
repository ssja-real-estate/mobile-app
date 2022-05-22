// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/map_type.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/services/database/hive_services.dart';
import 'package:saja/services/map_services/map_geoLocator.dart';

class MapScreeen extends StatelessWidget {
  MapScreeen({Key? key, required this.mapType}) : super(key: key);
  MapType mapType;
  MapControllerImpl mapControllerImpl = MapControllerImpl();

  late Rxn<MapOptions> mapOptions = Rxn();
  late Rx<Marker> markers;
  late LatLng lastLatLng;
  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  late Future future;
// Future future=initialOptions().then((value) => null);
  void move() {
    mapControllerImpl.move(LatLng(36.740438, 45.718937), 17);
  }

  MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    future = initialOptions();
    // initialOptions();
    return Scaffold(
      body: FutureBuilder(
          future: future.then((value) => value),
          builder: (context, snap) {
            if (snap.hasError || !snap.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.accent(),
                ),
              );
            }
            return Stack(
              children: [
                Obx(
                  () => FlutterMap(
                    key: ValueKey(MediaQuery.of(context).orientation),
                    mapController: mapControllerImpl,
                    options: mapOptions.value!,
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        attributionBuilder: (_) {
                          return const Text("Amlak");
                        },
                      ),
                      MarkerLayerOptions(
                        markers: [markers.value],
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, right: 10),
                      child: IconButton(
                          iconSize: 50,
                          onPressed: () async {
                            // if(!( await MapGeolocatorService.checkPermision(geolocatorPlatform: geolocatorPlatform))){

                            // }else{

                            // }
                          },
                          icon: Icon(Icons.gps_fixed_outlined)),
                    )),
              ],
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future initialOptions() async {
    lastLatLng = await getLastPosition();
    markerInitialize(latLng: lastLatLng);
    await HiveDatabase.close();
    mapOptions = await mapOptionsInitialize(latLng: lastLatLng);
    return true;
  }

  Future<LatLng> getLastPosition() async {
    Box latLngBox =
        await HiveDatabase.openBox(boxName: DatabaseStrings.latLngBox);
    LatLng latLng = await HiveServices.getLastLatLngPosition(box: latLngBox);
    return latLng;
  }

  Future<Rxn<MapOptions>> mapOptionsInitialize({required LatLng latLng}) async {
    return Rxn(MapOptions(
        center: latLng, //geolocator
        zoom: 14.0,
        onLongPress: (x, lng) {
          markers.value = Marker(
            width: 40.0,
            height: 40.0,
            point: lng,
            builder: (ctx) => InkWell(
              child: const FlutterLogo(),
              onTap: () {},
            ),
          );
        }));
  }

  void markerInitialize({required LatLng latLng}) {
    markers = Rx(Marker(
      width: 40.0,
      height: 40.0,
      point: latLng,
      builder: (ctx) => InkWell(
        child: const FlutterLogo(),
        onTap: () {},
      ),
    ));
  }
}
