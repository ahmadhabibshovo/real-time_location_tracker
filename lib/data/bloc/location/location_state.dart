import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum LocationPermission { loading, granted, denied }

class LocationState extends Equatable {
  const LocationState(
      {this.locationPermissionStatus = LocationPermission.loading,
      this.pointList = const []});
  final LocationPermission locationPermissionStatus;
  final List<LatLng> pointList;

  @override
  List<Object?> get props => [locationPermissionStatus, pointList];

  LocationState copyWith({
    LocationPermission? locationPermissionStatus,
    List<LatLng>? pointList,
  }) {
    return LocationState(
      locationPermissionStatus:
          locationPermissionStatus ?? this.locationPermissionStatus,
      pointList: pointList ?? this.pointList,
    );
  }
}
