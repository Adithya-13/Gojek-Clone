import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class AddRouteButton extends StatelessWidget {
  const AddRouteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorApp.grey, width: 1),
        borderRadius: BorderRadius.circular(36.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeApp.w12,
        vertical: SizeApp.h8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.add_circle_outline_rounded,
            color: ColorApp.red,
          ),
          Gap.customGapWidth(2),
          Text(
            'Tambah',
            style: TypographyApp.text1,
          ),
        ],
      ),
    );
  }
}
