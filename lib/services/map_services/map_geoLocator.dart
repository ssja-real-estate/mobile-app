import 'package:geolocator/geolocator.dart';

class MapGeolocatorService {
  static Future<bool> permisionStatus({required GeolocatorPlatform geolocatorPlatform}) async {
    bool serviceEnabled;

    // Test if location services are enabled.
    serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
    return serviceEnabled;
  }

  static Future<bool> checkPermision({required GeolocatorPlatform geolocatorPlatform}) async {
    LocationPermission permission;

    permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocatorPlatform.requestPermission();
      return (permission != LocationPermission.denied &&
          permission != LocationPermission.deniedForever);
    } else if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  static Future<Position> getCurrentPosition({required GeolocatorPlatform geolocatorPlatform}) async {
    return await geolocatorPlatform.getCurrentPosition();
  }
}
