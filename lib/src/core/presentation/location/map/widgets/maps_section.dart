import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as map;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsSection extends ConsumerStatefulWidget {
  const MapsSection({
    super.key,
    required this.pickup,
    required this.destination,
  });

  final map.Place pickup;
  final map.Place destination;

  @override
  ConsumerState<MapsSection> createState() => _MapsSectionState();
}

class _MapsSectionState extends ConsumerState<MapsSection> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  MapController get controller => ref.read(mapControllerProvider.notifier);
  MapState get state => ref.watch(mapControllerProvider);

  late final CameraPosition cameraPosition;

  @override
  void initState() {
    initCameraPosition();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await controller.init(widget.pickup, widget.destination);
    });
    super.initState();
  }

  /// [INFO]
  /// init camera position
  void initCameraPosition() {
    cameraPosition = CameraPosition(
      target: LatLng(
        widget.pickup.latLng?.lat ?? 0,
        widget.pickup.latLng?.lng ?? 0,
      ),
      zoom: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(mapControllerProvider, (previous, next) {
      if (previous?.markers != next.markers) {
        if (next.markers.isNotEmpty) {
          /// [INFO]
          /// when markers is done initialized, then animate the camera
          _animateCamera();
        }
      }
    });

    return GoogleMap(
      gestureRecognizers: {
        Factory<PanGestureRecognizer>(() => PanGestureRecognizer())
      },
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      polylines: Set<Polyline>.of(state.polylines.values),
      onMapCreated: (mapController) {
        _mapController.complete(mapController);
      },
      initialCameraPosition: cameraPosition,
      markers: state.markers,
    );
  }

  /// [INFO]
  /// animate the camera and set bounds from markers, then call polyline and calculate distance
  Future<void> _animateCamera() async {
    final GoogleMapController mapController = await _mapController.future;
    await mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        MapUtils.boundsFromLatLngList(
            state.markers.map((loc) => loc.position).toList()),
        20,
      ),
    );
    controller.getPolyline();
    controller.getDistance();
  }
}
