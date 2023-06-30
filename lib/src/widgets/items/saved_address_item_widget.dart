import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class SavedAddressItemWidget extends StatelessWidget {
  final String title;
  const SavedAddressItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: ColorApp.grey,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: SizeApp.w8,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeApp.w12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.bookmark,
            color: ColorApp.grey,
          ),
          Gap.w4,
          Text(
            title,
            style: TypographyApp.headline2,
          ),
        ],
      ),
    );
  }
}
