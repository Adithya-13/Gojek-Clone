import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as places;
import 'package:gojek_clone/gen/assets.gen.dart';
import 'package:gojek_clone/src/shared/shared.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final places.Place pickup;
  final places.Place destination;
  const MapPage({
    Key? key,
    required this.pickup,
    required this.destination,
  }) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final CameraPosition _cameraPosition;

  final Set<Marker> _markers = {};

  @override
  void initState() {
    _cameraPosition = CameraPosition(
      target: LatLng(
        widget.pickup.latLng?.lat ?? 0,
        widget.pickup.latLng?.lng ?? 0,
      ),
      zoom: 10,
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadMarkers();
    });
    super.initState();
  }

  Future<void> loadMarkers() async {
    final pickupIcon = BitmapDescriptor.fromBytes(
      await MapUtils.getImages(Assets.images.pickupMarker.path, 80),
    );
    final destinationIcon = BitmapDescriptor.fromBytes(
      await MapUtils.getImages(Assets.images.destinationMarker.path, 80),
    );
    _markers.addAll([
      Marker(
        markerId: const MarkerId('pickup'),
        position: LatLng(
          widget.pickup.latLng?.lat ?? 0,
          widget.pickup.latLng?.lng ?? 0,
        ),
        icon: pickupIcon,
      ),
      Marker(
        markerId: const MarkerId('destination'),
        position: LatLng(
          widget.destination.latLng?.lat ?? 0,
          widget.destination.latLng?.lng ?? 0,
        ),
        icon: destinationIcon,
      ),
    ]);
    setState(() {});
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
                          _markers.map((loc) => loc.position).toList()),
                      100,
                    ),
                  ),
                );
              },
              initialCameraPosition: _cameraPosition,
              markers: _markers,
            ),
          ),
        ],
      ),
    );
  }
}
