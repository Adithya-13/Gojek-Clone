import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/core/core.dart';

class DestinationController extends StateNotifier<DestinationState> {
  DestinationController() : super(const DestinationState());
}

final destinationControllerProvider =
    StateNotifierProvider.autoDispose<DestinationController, DestinationState>(
        (ref) {
  return DestinationController();
});
