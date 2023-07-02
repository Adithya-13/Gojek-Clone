import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class LocationListSection extends ConsumerWidget {
  const LocationListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(destinationControllerProvider);

    if (state.predictionList.isEmpty) {
      return const EmptyStateDestinationListSection();
    }
    return AsyncValueWidget(
        value: state.predictionListValue,
        data: (predictions) {
          return Expanded(
            child: ListView.builder(
              itemCount: predictions.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final prediction = predictions[index];
                return LocationCardWidget(prediction: prediction);
              },
            ),
          );
        },
    );
  }
}
