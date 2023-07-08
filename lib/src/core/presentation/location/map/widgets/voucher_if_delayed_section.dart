import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/shared/shared.dart';

class VoucherIfDelayedSection extends StatelessWidget {
  const VoucherIfDelayedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20.r),
              ),
              color: ColorApp.blue,
            ),
            padding: EdgeInsets.symmetric(
              vertical: SizeApp.h8,
              horizontal: SizeApp.w12,
            ),
            child: Text(
              'Voucher s.d. 10rb jika penjemputan tertunda',
              style: TypographyApp.subText1.white,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(20.r),
            ),
            color: ColorApp.darkBlue,
          ),
          padding: EdgeInsets.symmetric(
            vertical: SizeApp.h8,
            horizontal: SizeApp.w36,
          ),
          child: Text(
            'Cek',
            style: TypographyApp.subText1.bold.white,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
