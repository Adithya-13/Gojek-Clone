import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as places;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends ConsumerStatefulWidget {
  final places.Place pickup;
  final places.Place destination;
  const MapPage({
    Key? key,
    required this.pickup,
    required this.destination,
  }) : super(key: key);

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  MapController get controller => ref.read(mapControllerProvider.notifier);
  MapState get state => ref.read(mapControllerProvider);

  @override
  void initState() {
    controller.initCameraPosition(
      LatLng(
        widget.pickup.latLng?.lat ?? 0,
        widget.pickup.latLng?.lng ?? 0,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadMarkers(widget.pickup, widget.destination);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: context.screenHeightPercentage(0.4),
            child: GoogleMap(
              gestureRecognizers: {
                Factory<PanGestureRecognizer>(() => PanGestureRecognizer())
              },
              zoomControlsEnabled: true,
              myLocationButtonEnabled: false,
              onMapCreated: (controller) {
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () => controller.animateCamera(
                    CameraUpdate.newLatLngBounds(
                      MapUtils.boundsFromLatLngList(
                          state.markers.map((loc) => loc.position).toList()),
                      100,
                    ),
                  ),
                );
              },
              initialCameraPosition: controller.cameraPosition,
              markers: state.markers,
            ),
          ),
        ],
      ),
    );
  }
}
