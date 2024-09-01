import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationServices {
  static Future<bool> getLocationPermission() async {
    bool isGranted = false;
    // check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      LocationPermission requestPermission =
          await Geolocator.requestPermission();
      permission = await Geolocator.checkPermission();
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // Permission granted
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        isGranted = true;
      } else {
        Geolocator.openLocationSettings();
      }
    } else {
      // Permission denied
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
      }
    }
    return isGranted;
  }

  static Future<LatLng> getCurrentLocation() async {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
    );
    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    return LatLng(position.latitude, position.longitude);
  }
}
