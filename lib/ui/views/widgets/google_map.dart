import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:realtime_location_tracker/const.dart';
import 'package:realtime_location_tracker/data/bloc/location/location_bloc.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../data/bloc/location/location_event.dart';
import '../../../data/bloc/location/location_state.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      context.read<LocationBloc>().add(GetCurrentLocation());
    });

    super.initState();
  }

  GoogleMapController? _mapController;
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(24.1073732, 90.3708096),
    zoom: 7,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.pointList.length == 1) {
            _mapController!
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              bearing: 192.8334901395799,
              zoom: 16.251926040649414,
              target: state.pointList.last,
            )));
          }
          return Stack(
            children: [
              GoogleMap(
                style: Theme.of(context).brightness == Brightness.dark
                    ? AppConstant.googleMapDarkThemeJson
                    : null,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                markers: state.pointList.isNotEmpty
                    ? <Marker>{
                        Marker(
                            markerId: const MarkerId('currentLocation'),
                            position: state.pointList.last,
                            infoWindow: InfoWindow(
                              title: 'My Location',
                              snippet: state.pointList.last.toString(),
                            ),
                            onTap: () {
                              if (_mapController != null) {
                                _mapController!.showMarkerInfoWindow(
                                    const MarkerId('currentLocation'));
                              }
                            })
                      }
                    : <Marker>{},
                polylines: state.pointList.isNotEmpty
                    ? <Polyline>{
                        Polyline(
                            color: Colors.blue,
                            polylineId: const PolylineId('currentLocation'),
                            points: state.pointList,
                            width: 6,
                            jointType: JointType.round),
                      }
                    : <Polyline>{},
              ),
              if (state.pointList.isEmpty)
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StrokeText(
                          text: "Fetching Your Location",
                          textStyle:
                              TextStyle(fontSize: 30, color: Colors.white),
                          strokeColor: Colors.black,
                          strokeWidth: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircularProgressIndicator(
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
