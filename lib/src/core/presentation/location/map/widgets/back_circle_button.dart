import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class BackCircleButton extends StatelessWidget {
  const BackCircleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: ColorApp.white,
          shadows: kElevationToShadow[1],
        ),
        padding: EdgeInsets.all(SizeApp.h12),
        child: const Icon(
          Icons.keyboard_arrow_left_rounded,
          color: ColorApp.darkGrey,
        ),
      ),
    );
  }
}
