import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/core/core.dart';

class TransportationListWidget extends ConsumerWidget {
  const TransportationListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapControllerProvider);

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.transportations.length,
      itemBuilder: (BuildContext context, int index) {
        final transportation = state.transportations[index];
        return TransportationItemWidget(
          transportation: transportation,
          distance: state.distanceInMeters,
        );
      },
    );
  }
}
