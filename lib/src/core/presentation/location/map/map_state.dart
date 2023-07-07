import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final Set<Marker> markers;
  const MapState({
    this.markers = const {},
  });

  MapState copyWith({
    Set<Marker>? markers,
  }) {
    return MapState(
      markers: markers ?? this.markers,
    );
  }
}
