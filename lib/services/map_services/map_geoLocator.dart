import 'package:geolocator/geolocator.dart';

class MapGeolocatorService {
  static Future<bool> permisionStatus() async {
    bool serviceEnabled;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    return serviceEnabled;
  }

  static Future<bool> checkPermision() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      return (permission != LocationPermission.denied &&
          permission != LocationPermission.deniedForever);
    } else if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  static Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }
}
