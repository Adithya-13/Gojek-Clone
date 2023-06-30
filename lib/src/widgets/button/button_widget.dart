
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorApp.grey),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: SizeApp.w12, vertical: SizeApp.h8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Gap.w4,
          Text(
            title,
            style: TypographyApp.subText2,
          ),
        ],
      ),
    );
  }
}
