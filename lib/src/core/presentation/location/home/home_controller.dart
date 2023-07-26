import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:overlay_support/overlay_support.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(const HomeState()) {
    determinePosition();
  }

  /// [INFO]
  /// to get the current position
  void determinePosition() async {
    state = state.copyWith(isLoading: true);

    // Test if location services are enabled.
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      toast('Location services are disabled.');
      state = state.copyWith(isLoading: false);
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        toast('Location permissions are denied 2');
        state = state.copyWith(isLoading: false);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      toast(
          'Location permissions are permanently denied, we cannot request permissions.');
      state = state.copyWith(isLoading: false);
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    );

    state = state.copyWith(
      userLocation: currentPosition,
      isLoading: false,
    );
  }
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController();
});
