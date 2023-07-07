import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart' as map;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/gen/assets.gen.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends StateNotifier<MapState> {
  MapController() : super(const MapState());

  late final CameraPosition cameraPosition;

  void initCameraPosition(LatLng latLng) {
    cameraPosition = CameraPosition(
      target: latLng,
      zoom: 10,
    );
  }

  Future<void> loadMarkers(map.Place pickup, map.Place destination) async {
    final pickupIcon = BitmapDescriptor.fromBytes(
      await MapUtils.getImages(Assets.images.pickupMarker.path, 80),
    );
    final destinationIcon = BitmapDescriptor.fromBytes(
      await MapUtils.getImages(Assets.images.destinationMarker.path, 80),
    );
    state = state.copyWith(
      markers: {
        Marker(
          markerId: const MarkerId('pickup'),
          position: LatLng(
            pickup.latLng?.lat ?? 0,
            pickup.latLng?.lng ?? 0,
          ),
          icon: pickupIcon,
        ),
        Marker(
          markerId: const MarkerId('destination'),
          position: LatLng(
            destination.latLng?.lat ?? 0,
            destination.latLng?.lng ?? 0,
          ),
          icon: destinationIcon,
        ),
      },
    );
  }
}

final mapControllerProvider =
    StateNotifierProvider<MapController, MapState>((ref) {
  return MapController();
});
