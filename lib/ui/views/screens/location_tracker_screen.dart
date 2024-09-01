import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_location_tracker/data/bloc/theme/theme_bloc.dart';
import 'package:realtime_location_tracker/ui/views/widgets/google_map.dart';

class LocationTracker extends StatefulWidget {
  const LocationTracker({super.key});

  @override
  State<LocationTracker> createState() => _LocationTrackerState();
}

class _LocationTrackerState extends State<LocationTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Location Tracker'),
        centerTitle: true,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context
                        .read<ThemeBloc>()
                        .add(ChangeThemeMode(context: context));
                  },
                  icon: Icon(Theme.of(context).brightness == Brightness.dark
                      ? Icons.dark_mode
                      : Icons.light_mode));
            },
          )
        ],
      ),
      body: const GoogleMapWidget(),
    );
  }
}
