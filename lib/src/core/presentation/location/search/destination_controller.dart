import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/core/core.dart';

class DestinationController extends StateNotifier<DestinationState> {
  final LocationService locationService;
  DestinationController(
    this.locationService,
  ) : super(const DestinationState());

  final pickupController = TextEditingController();
  final destinationController = TextEditingController();
  final pickupFocusNode = FocusNode();
  final destinationFocusNode = FocusNode();

  Timer? _debounce;

  void onChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        reset();
        return;
      }
      search(query);
    });
  }

  void search(String query) async {
    state = state.copyWith(
      predictionListValue: const AsyncLoading(),
    );

    try {
      final result = await locationService.autoCompleteSearch(query: query);
      state = state.copyWith(
        predictionList: result,
        predictionListValue: AsyncData(result),
      );
    } catch (error, stackTrace) {
      state = state.copyWith(
        predictionListValue: AsyncError(error, stackTrace),
      );
    }
  }

  void reset() {
    state = state.copyWith(
      predictionList: [],
      predictionListValue: const AsyncData([]),
    );
  }

  Future<void> onPredictionTap(AutocompletePrediction prediction) async {
    final place = await locationService.fetchPlace(prediction.placeId);
    if (pickupFocusNode.hasFocus) {
      state = state.copyWith(
        pickup: place,
      );
      pickupController.text = prediction.primaryText;
      reset();
      if (state.destination == null) {
        destinationFocusNode.requestFocus();
      }
    } else {
      state = state.copyWith(
        destination: place,
      );
      destinationController.text = prediction.primaryText;
      reset();
    }
  }

  @override
  void dispose() {
    pickupController.dispose();
    destinationController.dispose();
    _debounce?.cancel();
    pickupFocusNode.dispose();
    destinationFocusNode.dispose();
    super.dispose();
  }
}

final destinationControllerProvider =
    StateNotifierProvider<DestinationController, DestinationState>((ref) {
  final locationService = ref.read(locationServiceProvider);
  return DestinationController(locationService);
});
