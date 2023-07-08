import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class ScheduledButton extends StatelessWidget {
  const ScheduledButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: ColorApp.darkGreen,
            width: 2,
          ),
        ),
        color: ColorApp.white,
      ),
      padding: EdgeInsets.all(SizeApp.h8),
      child: const Icon(
        Icons.date_range_rounded,
        color: ColorApp.darkGreen,
      ),
    );
  }
}
