import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';

class ProtectionCardSection extends StatelessWidget {
  const ProtectionCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.lightGreen,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: CupertinoContextMenu.kEndBoxShadow,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeApp.w16),
            child: Row(
              children: [
                const Icon(
                  Icons.shield_outlined,
                  color: ColorApp.white,
                ),
                Gap.w8,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Lebih aman pakai PerjalananAman+',
                        style: TypographyApp.text1.white,
                      ),
                      Gap.h4,
                      Text(
                        'Voucher s.d. 10rb jika penjemputan tertunda, Aktifin sekarang, yuk!',
                        style: TypographyApp.subText2.white.fontSizeCustom(10),
                      ),
                    ],
                  ),
                ),
                Gap.w8,
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: ColorApp.white,
                ),
              ],
            ),
          ),
          Gap.h4,
          const LocationCardSection(),
        ],
      ),
    );
  }
}
