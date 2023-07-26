import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';

class MapPage extends StatelessWidget {
  final Place pickup;
  final Place destination;
  const MapPage({
    Key? key,
    required this.pickup,
    required this.destination,
  }) : super(key: key);

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
            child: MapsSection(pickup: pickup, destination: destination),
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
