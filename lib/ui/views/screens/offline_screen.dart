import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_location_tracker/data/bloc/location/location_bloc.dart';
import 'package:realtime_location_tracker/data/bloc/location/location_event.dart';

class OfflineScreen extends StatefulWidget {
  const OfflineScreen({super.key});

  @override
  State<OfflineScreen> createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {
  @override
  void initState() {
    context.read<LocationBloc>().add(ClearPointList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            size: 100,
            Icons.wifi_off_sharp,
            color: Colors.red,
          )),
          Center(
            child: Text(
                'No Internet Connection Available\n Check your Internet Connection',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          )
        ],
      ),
    );
  }
}
