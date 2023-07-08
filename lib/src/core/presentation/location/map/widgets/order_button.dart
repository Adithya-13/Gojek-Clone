import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/shared/shared.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: ColorApp.darkGreen,
      ),
      padding: EdgeInsets.symmetric(
        vertical: SizeApp.h8,
        horizontal: SizeApp.h16,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesan GoRide',
                  style: TypographyApp.text1.white,
                ),
                Gap.h4,
                Text(
                  'Bakal dapet 13 XP',
                  style: TypographyApp.subText1.white,
                ),
              ],
            ),
          ),
          Text(
            'Rp33.500',
            style: TypographyApp.headline1.white,
          ),
          Gap.w20,
          const Icon(
            Icons.arrow_circle_right_rounded,
            color: ColorApp.white,
          ),
        ],
      ),
    );
  }
}
