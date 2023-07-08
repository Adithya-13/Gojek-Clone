import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsSection extends ConsumerWidget {
  const MapsSection({
    super.key,
    required this.cameraPosition,
  });

  final CameraPosition cameraPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapControllerProvider);
    final controller = ref.watch(mapControllerProvider.notifier);

    return GoogleMap(
      gestureRecognizers: {
        Factory<PanGestureRecognizer>(() => PanGestureRecognizer())
      },
      zoomControlsEnabled: true,
      myLocationButtonEnabled: false,
      polylines: Set<Polyline>.of(state.polylines.values),
      onMapCreated: (mapController) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            mapController.animateCamera(
              CameraUpdate.newLatLngBounds(
                MapUtils.boundsFromLatLngList(
                    state.markers.map((loc) => loc.position).toList()),
                100,
              ),
            );
            controller.getPolyline();
            controller.getDistance();
          },
        );
      },
      initialCameraPosition: cameraPosition,
      markers: state.markers,
    );
  }
}
