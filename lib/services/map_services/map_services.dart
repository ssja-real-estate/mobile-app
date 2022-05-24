import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:saja/database/hive_database.dart';
import 'package:saja/resources/asset_addresses.dart';
import 'package:saja/resources/database.dart';
import 'package:saja/services/database/hive_services.dart';

class MapServices{
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
  static  Future<LatLng> getLastPosition() async {
    Box latLngBox =
        await HiveDatabase.openBox(boxName: DatabaseStrings.latLngBox);
    LatLng latLng = await HiveServices.getLastLatLngPosition(box: latLngBox);
    return latLng;
  }
}