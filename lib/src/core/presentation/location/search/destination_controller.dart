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

  void onPredictionTap(AutocompletePrediction prediction) {
    if (pickupFocusNode.hasFocus) {
      state = state.copyWith(
        pickup: prediction,
      );
      pickupController.text = prediction.primaryText;
      reset();
      destinationFocusNode.requestFocus();
    } else {
      state = state.copyWith(
        destination: prediction,
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
