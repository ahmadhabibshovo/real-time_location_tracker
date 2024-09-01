import 'package:flutter/material.dart';
import 'package:realtime_location_tracker/config/routes/routes_name.dart';

import '../../ui/views/views.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return getMaterialRoute(const SplashScreen());
      case RoutesName.locationTrackerScreen:
        return getMaterialRoute(const LocationTracker());
      case RoutesName.noLocationPermissionScreen:
        return getMaterialRoute(const LocationPermissionScreen());
      case RoutesName.offlineScreen:
        return getMaterialRoute(const OfflineScreen());
      default:
        return getMaterialRoute(
            const Scaffold(body: Center(child: Text('No Route Generated'))));
    }
  }
}

MaterialPageRoute getMaterialRoute(route) {
  return MaterialPageRoute(builder: (_) => route);
}
