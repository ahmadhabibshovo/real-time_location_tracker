import 'package:equatable/equatable.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();
}

class GetLocationPermission extends LocationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCurrentLocation extends LocationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ClearPointList extends LocationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
