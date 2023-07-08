import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';

class PickupSection extends StatelessWidget {
  const PickupSection({
    super.key,
    required this.state,
  });

  final MapState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: ColorApp.green,
          ),
          padding: const EdgeInsets.all(2),
          child: const Icon(
            Icons.arrow_upward_rounded,
            color: ColorApp.white,
            size: 16,
          ),
        ),
        Gap.w12,
        Expanded(
          child: Text(
            state.pickup?.name ?? '',
            style: TypographyApp.headline2,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
