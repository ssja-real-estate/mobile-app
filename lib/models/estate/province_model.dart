import 'dart:ffi';

import 'package:saja/resources/Estate.dart';
import 'package:saja/resources/map.dart';

class ProvinceModel {
  late String id, name;
  late double long, lat;
  late int zoom;
  late List cities;
  ProvinceModel.fromMap({required Map map}) {
    id = map[EstateStrings.provinceId];

    name = map[EstateStrings.provinceName];
    cities = map[EstateStrings.provinceCities];
    long = map[MapResources.mapInfo][MapResources.longitude].toDouble();
    lat = map[MapResources.mapInfo][MapResources.latitude].toDouble();
    zoom = map[MapResources.mapInfo][MapResources.zoom];
  }
}
