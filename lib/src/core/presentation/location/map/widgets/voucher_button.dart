import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class VoucherButton extends StatelessWidget {
  const VoucherButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorApp.grey),
      ),
      padding: EdgeInsets.all(SizeApp.h4),
      child: Text(
        'Voucher',
        style: TypographyApp.text1,
      ),
    );
  }
}
