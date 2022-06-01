// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:saja/resources/asset_addresses.dart';
import 'package:saja/resources/colors.dart';
import 'package:saja/resources/map.dart';
import 'package:saja/screens/map/custom_tile.dart';

class ChooseWidget extends StatelessWidget {
  ChooseWidget(
      {Key? key,
      required this.mapControllerImpl,
      required this.markers,
      required this.mapOptions})
      : super(key: key);
  final MapControllerImpl mapControllerImpl; // It's have to be a dependency
  late Rxn<MapOptions> mapOptions = Rxn();
  late Rx<Marker> markers;
  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
