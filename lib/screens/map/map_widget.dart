// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:saja/resources/asset_addresses.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/map.dart';
import 'package:saja/screens/map/custom_tile.dart';

class MapWidget extends StatelessWidget {
  MapWidget(
      {Key? key,
      required this.mapControllerImpl,
      this.markers,
      this.marker,
      required this.mapOptions})
      : super(key: key);
  final MapControllerImpl mapControllerImpl; // It's have to be a dependency
  late Rxn<MapOptions> mapOptions = Rxn();
  Rx<Marker>? marker;
  List<Rx<Marker>>? markers;
  List<Marker>? markersList;
  @override
  Widget build(BuildContext context) {
    if (marker == null) {
      print("if in build started");
      markersList = markersToList(markers!);
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
                markers: markersList ?? [marker!.value],
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Marker> markersToList(List<Rx<Marker>> markers) {
    List<Marker> list = [];
    for (var i = 0; i < markers.length; i++) {
      list.add(markers[i].value);
    }
    return list;
  }
}
