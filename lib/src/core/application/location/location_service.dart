import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/core/core.dart';

class LocationService {
  final LocationRepository locationRepository;

  LocationService(this.locationRepository);

  Future<List<AutocompletePrediction>> autoCompleteSearch(String query) =>
      locationRepository.autoCompleteSearch(query);
}

final locationServiceProvider = Provider<LocationService>((ref) {
  final locationRepository = ref.read(locationRepositoryProvider);
  return LocationService(locationRepository);
});
