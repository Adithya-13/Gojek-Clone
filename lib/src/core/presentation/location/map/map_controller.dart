import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as map;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gojek_clone/gen/assets.gen.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends StateNotifier<MapState> {
  MapController() : super(const MapState());

  PolylinePoints polylinePoints = PolylinePoints();

  /// [INFO]
  /// init the markers, polyline, and transportations
  Future<void> init(map.Place pickup, map.Place destination) async {
    print('TESSS onInit');
    state = state.copyWith(
      pickup: pickup,
      destination: destination,
    );

    await loadMarkers();
    _addPolyLine();
    loadTransportations();
  }

  /// [INFO]
  /// load the markers
  Future<void> loadMarkers() async {
    /// [INFO]
    /// get the image from assets
    final pickupIcon = BitmapDescriptor.fromBytes(
      await MapUtils.getImages(Assets.images.pickupMarker.path, 80),
    );
    final destinationIcon = BitmapDescriptor.fromBytes(
      await MapUtils.getImages(Assets.images.destinationMarker.path, 80),
    );

    /// [INFO]
    /// set the markers into state
    state = state.copyWith(
      markers: {
        Marker(
          markerId: const MarkerId('pickup'),
          position: LatLng(
            state.pickup?.latLng?.lat ?? 0,
            state.pickup?.latLng?.lng ?? 0,
          ),
          icon: pickupIcon,
        ),
        Marker(
          markerId: const MarkerId('destination'),
          position: LatLng(
            state.destination?.latLng?.lat ?? 0,
            state.destination?.latLng?.lng ?? 0,
          ),
          icon: destinationIcon,
        ),
      },
    );
  }

  /// [INFO]
  /// styling the polylines
  void _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: ColorApp.green,
      width: 4,
      points: state.polylineCoordinates,
      endCap: Cap.roundCap,
      startCap: Cap.roundCap,
      jointType: JointType.round,
    );

    final tempPolylines = {id: polyline};
    state = state.copyWith(polylines: tempPolylines);
  }

  /// [INFO]
  /// add polyline between markers
  void getPolyline() async {
    /// [INFO]
    /// getting Polyline from 2 Markers
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      FlutterConfig.get("MAP_API_KEY"),
      PointLatLng(
        state.pickup!.latLng?.lat ?? 0,
        state.pickup!.latLng?.lng ?? 0,
      ),
      PointLatLng(
        state.destination?.latLng?.lat ?? 0,
        state.destination?.latLng?.lng ?? 0,
      ),
      travelMode: TravelMode.driving,
    );

    /// [INFO]
    /// if there's any, set it into polyllineCoordinates that can be used in [_addPolyLine()]
    if (result.points.isNotEmpty) {
      final tempPolylineCoordinates = <LatLng>[];
      for (var point in result.points) {
        tempPolylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      state = state.copyWith(
        polylineCoordinates: tempPolylineCoordinates,
      );
    }
    _addPolyLine();
  }

  /// [INFO]
  /// how to get the distance for pricing
  Future<void> getDistance() async {
    final distanceInMeters = Geolocator.distanceBetween(
      state.pickup!.latLng?.lat ?? 0,
      state.pickup!.latLng?.lng ?? 0,
      state.destination?.latLng?.lat ?? 0,
      state.destination?.latLng?.lng ?? 0,
    );

    print(distanceInMeters);

    state = state.copyWith(
      distanceInMeters: distanceInMeters,
    );
  }

  /// [INFO]
  /// all of the transportation and price per meters
  void loadTransportations() {
    final tempTransportations = [
      Transportation(
        title: 'GoRide',
        etaStart: 1,
        etaEnd: 4,
        pricePerMeters: 250,
        totalPerson: 1,
      ),
      Transportation(
        title: 'GoCar',
        etaStart: 3,
        etaEnd: 7,
        pricePerMeters: 400,
        totalPerson: 4,
      ),
      Transportation(
        title: 'GoCar (L)',
        etaStart: 3,
        etaEnd: 7,
        pricePerMeters: 450,
        totalPerson: 6,
      ),
    ];
    state = state.copyWith(transportations: tempTransportations);
  }
}

final mapControllerProvider =
    StateNotifierProvider<MapController, MapState>((ref) {
  return MapController();
});
