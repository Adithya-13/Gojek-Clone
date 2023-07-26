import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/core/core.dart';

class LocationService {
  final LocationRepository locationRepository;

  LocationService(this.locationRepository);

  /// [INFO]
  /// To Get Autocomplete Places on [DestinationPage]
  Future<List<AutocompletePrediction>> autoCompleteSearch(
          {required String query}) =>
      locationRepository.autoCompleteSearch(query: query);

  /// [INFO]
  /// To Get the detail of the place from autocomplete
  Future<Place?> fetchPlace(String placeId) =>
      locationRepository.fetchPlace(placeId);
}

final locationServiceProvider = Provider<LocationService>((ref) {
  final locationRepository = ref.read(locationRepositoryProvider);
  return LocationService(locationRepository);
});
