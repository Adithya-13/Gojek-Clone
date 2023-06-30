import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class CurrentLocationMapSection extends StatelessWidget {
  const CurrentLocationMapSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.grey,
        borderRadius: BorderRadius.circular(20.r),
      ),
      height: 140,
    );
  }
}
