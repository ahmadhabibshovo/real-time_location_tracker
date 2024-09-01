import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:realtime_location_tracker/data/bloc/location/location_event.dart';
import 'package:realtime_location_tracker/data/bloc/location/location_state.dart';
import 'package:realtime_location_tracker/data/repository/location_services.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  List<LatLng> pointList = [];

  LocationBloc() : super(const LocationState()) {
    on<GetLocationPermission>(_getLocationPermission);
    on<GetCurrentLocation>(_getCurrentLocation);
    on<ClearPointList>(_clearPointList);
  }
  _getLocationPermission(
      GetLocationPermission event, Emitter<LocationState> emit) async {
    bool isGranted = await LocationServices.getLocationPermission();
    emit(state.copyWith(
        locationPermissionStatus: isGranted
            ? LocationPermission.granted
            : LocationPermission.denied));
  }

  _getCurrentLocation(
      GetCurrentLocation event, Emitter<LocationState> emit) async {
    LatLng position = await LocationServices.getCurrentLocation();
    pointList.add(position);
    emit(state.copyWith(pointList: List.from(pointList)));
  }

  _clearPointList(ClearPointList event, Emitter<LocationState> emit) async {
    pointList.clear();
    emit(state.copyWith(pointList: List.from(pointList)));
  }
}
