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
  MapState get state => ref.watch(mapControllerProvider);
  late final CameraPosition cameraPosition;

  @override
  void initState() {
    initCameraPosition();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init(widget.pickup, widget.destination);
    });
    super.initState();
  }

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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: context.screenHeightPercentage(0.4),
            child: MapsSection(cameraPosition: cameraPosition),
          ),
          const Positioned(
            left: 16,
            right: 16,
            top: 20,
            child: PickupDestinationSection(),
          ),
          Positioned(
            left: 16,
            bottom: context.screenHeightPercentage(0.44) + 16,
            child: const BackCircleButton(),
          ),
          const Positioned.fill(
            child: TransportationAndOrderSection(),
          ),
        ],
      ),
    );
  }
}
