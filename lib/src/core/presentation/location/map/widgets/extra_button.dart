import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class ExtraButton extends StatelessWidget {
  const ExtraButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(
            side: BorderSide(
          color: ColorApp.grey,
        )),
        color: ColorApp.white,
      ),
      padding: EdgeInsets.all(SizeApp.h4),
      child: const Icon(
        Icons.add_box_rounded,
        color: ColorApp.black,
      ),
    );
  }
}
