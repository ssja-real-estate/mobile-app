// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/map_type.dart';
import 'package:saja/resources/api.dart';
import 'package:saja/resources/asset_addresses.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/resources/map.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/map/custom_tile.dart';
import 'package:saja/services/api/api.dart';
import 'package:saja/services/database/hive_services.dart';
import 'package:saja/services/map_services/map_geoLocator.dart';
import 'package:saja/services/map_services/map_services.dart';
import 'package:saja/services/snackbar/custom_snack_bar.dart';
import 'package:saja/widgets/custom_text_button.dart';

class MapScreeen extends StatelessWidget {
  MapScreeen({Key? key, required this.mapType}) : super(key: key);
  MapType mapType;
  MapControllerImpl mapControllerImpl = MapControllerImpl();

  late Rxn<MapOptions> mapOptions = Rxn();
  late Rx<Marker> markers;
  late LatLng lastLatLng;
  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  late Future future;
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
                Obx(
                  () => FlutterMap(
                    key: ValueKey(MediaQuery.of(context).orientation),
                    mapController: mapControllerImpl,
                    options: mapOptions.value!,
                    layers: [
                      TileLayerOptions(
                          backgroundColor: AppColors.accent(),
                          urlTemplate: MapResources.openStreetAddress,
                          subdomains: ['a', 'b', 'c'],
                          attributionBuilder: (_) {
                            return Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text("Amlak"),
                                ));
                          },
                          tileProvider: MyCustomTile(
                              image: AssetImage(AppAssetAddress.logoAddress)),
                          errorTileCallback: (x, y) async {
                            print("error eccured");
                          }),
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
                            gpsIcon.value = MapIcons.gpsIconTracking;
                            if (!(await MapGeolocatorService.checkPermision(
                                geolocatorPlatform: geolocatorPlatform))) {
                              CustomSnackBar.showSnackbar(
                                  title: AppStrings.error,
                                  message: MapResources.noGpsService);
                              gpsIcon.value = MapIcons.gpsIcon;

                              print("no service");
                            } else {
                              print("have service");
                              try {
                                var position = await MapGeolocatorService
                                    .getCurrentPosition(
                                        geolocatorPlatform: geolocatorPlatform);
                                lastLatLng.latitude = position.latitude;
                                lastLatLng.longitude = position.longitude;
                                move(lastLatLng: lastLatLng);
                              } catch (e) {
                                gpsIcon.value = MapIcons.gpsIcon;

                                CustomSnackBar.showSnackbar(
                                    title: AppStrings.error,
                                    message: MapResources.errorTracking);

                                print('e is');
                                printError(info: e.toString());
                              }
                            }
                          },
                          icon: Obx(() => Icon(gpsIcon.value))),
                    )),
              ],
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future initialOptions() async {
    lastLatLng = await MapServices.getLastPosition();
    markerInitialize(latLng: lastLatLng);
    await HiveDatabase.close();
    mapOptions = await mapOptionsInitialize(latLng: lastLatLng);
    return true;
  }

  Future<Rxn<MapOptions>> mapOptionsInitialize({required LatLng latLng}) async {
    return Rxn(MapOptions(
        center: latLng, //geolocator
        zoom: 14.0,
        onLongPress: (x, lng) {
          markers = Rx(MapServices.customMarker(latLng: lng));
        }));
  }

  void markerInitialize({required LatLng latLng}) {
    markers = Rx(MapServices.customMarker(latLng: latLng));
  }
}
