import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';

class LocationCardSection extends StatelessWidget {
  const LocationCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.all(SizeApp.h12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CurrentLocationMapSection(),
          Gap.h12,
          const SearchLocationButton(),
          Gap.h40,
          const SavedAddressSection(),
        ],
      ),
    );
  }
}
