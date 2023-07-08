import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as map;
import 'package:gojek_clone/src/core/core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final Set<Marker> markers;
  final Map<PolylineId, Polyline> polylines;
  final List<LatLng> polylineCoordinates;
  final map.Place? pickup;
  final map.Place? destination;
  final double distanceInMeters;
  final List<Transportation> transportations;

  const MapState({
    this.markers = const {},
    this.polylines = const {},
    this.polylineCoordinates = const [],
    this.pickup,
    this.destination,
    this.distanceInMeters = 0,
    this.transportations = const [],
  });

  MapState copyWith({
    Set<Marker>? markers,
    Map<PolylineId, Polyline>? polylines,
    List<LatLng>? polylineCoordinates,
    map.Place? pickup,
    map.Place? destination,
    double? distanceInMeters,
    List<Transportation>? transportations,
  }) {
    return MapState(
      markers: markers ?? this.markers,
      polylines: polylines ?? this.polylines,
      polylineCoordinates: polylineCoordinates ?? this.polylineCoordinates,
      pickup: pickup ?? this.pickup,
      destination: destination ?? this.destination,
      distanceInMeters: distanceInMeters ?? this.distanceInMeters,
      transportations: transportations ?? this.transportations,
    );
  }
}
