import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class DestinationSection extends StatelessWidget {
  const DestinationSection({
    super.key,
    required this.state,
  });

  final MapState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleDotWidget(
          withAnimation: false,
          size: 20,
          innerSize: 6,
        ),
        Gap.w12,
        Expanded(
          child: Text(
            state.destination?.name ?? '',
            style: TypographyApp.headline2,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
