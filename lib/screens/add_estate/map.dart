// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/models/enums/map_type.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/services/database/hive_services.dart';

class MapScreeen extends StatefulWidget {
  MapScreeen({Key? key, required this.mapType}) : super(key: key);
  MapType mapType;
  @override
  State<MapScreeen> createState() => _MapScreeenState();
}

class _MapScreeenState extends State<MapScreeen> {
  MapControllerImpl mapControllerImpl = MapControllerImpl();

  late MapOptions mapOptions;
  late Marker markers;
  late LatLng lastLatLng;

  void move() {
    mapControllerImpl.move(LatLng(36.740438, 45.718937), 17);
  }

  MapController mapController = MapController();
  @override
  void initState() {
    super.initState();
    initialOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.gps_fixed_outlined))),
          FlutterMap(
            key: ValueKey(MediaQuery.of(context).orientation),
            mapController: mapControllerImpl,
            options: mapOptions,
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
                markers: [markers],
              ),
            ],
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void initialOptions() async {
    lastLatLng = await getLastPosition();
    markerInitialize(latLng: lastLatLng);
    mapOptionsInitialize();
    await HiveDatabase.close();
  }

  Future<LatLng> getLastPosition() async {
    Box latLngBox =
        await HiveDatabase.openBox(boxName: DatabaseStrings.latLngBox);
    LatLng latLng = await HiveServices.getLastLatLngPosition(box: latLngBox);
    return latLng;
  }

  void mapOptionsInitialize() {
    mapOptions = MapOptions(
        center: LatLng(36.7631, 45.7222), //geolocator
        zoom: 14.0,
        onLongPress: (x, lng) {
          markers = Marker(
            width: 40.0,
            height: 40.0,
            point: lng,
            builder: (ctx) => InkWell(
              child: const FlutterLogo(),
              onTap: () {
                print(lng);
                print('added');
              },
            ),
          );
          print(lng);
          setState(() {});
          // print(x);
        });
  }

  void markerInitialize({required LatLng latLng}) {
    markers = Marker(
      width: 40.0,
      height: 40.0,
      point: latLng,
      builder: (ctx) => InkWell(
        child: const FlutterLogo(),
        onTap: () {
          print(latLng);
          print('added');
        },
      ),
    );
  }
}
