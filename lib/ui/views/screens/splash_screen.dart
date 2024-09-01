import 'package:flutter/material.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:realtime_location_tracker/ui/views/screens/location_permission_screen.dart';

import 'offline_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectivityBuilder(
        builder: (status) {
          if (status == ConnectivityStatus.online) {
            return const LocationPermissionScreen();
          } else if (status == ConnectivityStatus.offline) {
            return const OfflineScreen();
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/playstore-icon.png'),
                  radius: 50,
                ),
                Text(
                  'Real Time Location \nTracker',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
