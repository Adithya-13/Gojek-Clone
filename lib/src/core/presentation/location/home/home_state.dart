import 'package:geolocator/geolocator.dart';

class HomeState {
  final bool isLoading;
  final Position? userLocation;
  const HomeState({
    this.isLoading = false,
    this.userLocation,
  });

  HomeState copyWith({
    bool? isLoading,
    Position? userLocation,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      userLocation: userLocation ?? this.userLocation,
    );
  }
}
