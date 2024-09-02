import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_location_tracker/data/bloc/location/location_state.dart';
import 'package:realtime_location_tracker/ui/views/screens/location_tracker_screen.dart';

import '../../../data/bloc/location/location_bloc.dart';
import '../../../data/bloc/location/location_event.dart';

class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  @override
  void initState() {
    context.read<LocationBloc>().add(GetLocationPermission());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.locationPermissionStatus == LocationPermission.granted) {
            Future.delayed(const Duration(seconds: 1));
            return const LocationTracker();
          } else if (state.locationPermissionStatus ==
              LocationPermission.denied) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                    child: Icon(
                  size: 100,
                  Icons.location_off_outlined,
                  color: Colors.red,
                )),
                const Center(
                  child: Text(
                      'Location Permission Denied\n Grant Location Permission',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<LocationBloc>().add(GetLocationPermission());
                    },
                    child: const Text('Grant Location Permission')),
              ],
            );
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text('Checking for Location Permission',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
