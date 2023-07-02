import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationRepository {
  final FlutterGooglePlacesSdk googlePlace;

  LocationRepository(this.googlePlace);

  Future<List<AutocompletePrediction>> autoCompleteSearch(
      {required String query}) async {
    final predictions = await googlePlace.findAutocompletePredictions(query);
    return predictions.predictions;
  }
}

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  final googlePlace = FlutterGooglePlacesSdk(FlutterConfig.get('MAP_API_KEY'));
  return LocationRepository(googlePlace);
});
