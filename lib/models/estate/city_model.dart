import 'package:saja/resources/Estate.dart';
import 'package:saja/resources/map.dart';

class CityModel {
  late String id, name;
  late double long, lat;
  late int zoom;
  late List naighborhood;
  CityModel.fromMap({required Map map}) {
    id = map[EstateStrings.cityId];
    name = map[EstateStrings.cityName];
    naighborhood = map[EstateStrings.neighborhoods];
    long = map[MapResources.mapInfo][MapResources.longitude].toDouble();
    lat = map[MapResources.mapInfo][MapResources.latitude].toDouble();
    zoom = map[MapResources.mapInfo][MapResources.zoom];
  }
}
