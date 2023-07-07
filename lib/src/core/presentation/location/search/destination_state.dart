import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DestinationState {
  final AsyncValue<List<AutocompletePrediction>> predictionListValue;
  final List<AutocompletePrediction> predictionList;
  final Place? pickup;
  final Place? destination;
  const DestinationState({
    this.predictionListValue = const AsyncData([]),
    this.predictionList = const [],
    this.pickup,
    this.destination,
  });

  DestinationState copyWith({
    AsyncValue<List<AutocompletePrediction>>? predictionListValue,
    List<AutocompletePrediction>? predictionList,
    Place? pickup,
    Place? destination,
  }) {
    return DestinationState(
      predictionListValue: predictionListValue ?? this.predictionListValue,
      predictionList: predictionList ?? this.predictionList,
      pickup: pickup ?? this.pickup,
      destination: destination ?? this.destination,
    );
  }
}
