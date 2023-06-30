import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class DestinationFormSection extends StatelessWidget {
  const DestinationFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorApp.grey),
        color: ColorApp.lightGrey,
      ),
      padding: EdgeInsets.all(SizeApp.h12),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: ColorApp.green,
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  color: ColorApp.white,
                ),
              ),
              Gap.h4,
              const VerticalDash(
                height: 20,
              ),
              Gap.h4,
              const CircleDotWidget(
                withAnimation: false, //i change into false due to performance
              ),
            ],
          ),
          Gap.w16,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputFormWidget(
                  controller: TextEditingController(),
                  hintText: 'Cari lokasi jemput',
                ),
                Gap.h4,
                const Divider(
                  color: ColorApp.grey,
                  endIndent: 0,
                  indent: 0,
                  height: 0,
                  thickness: 1,
                ),
                Gap.h4,
                InputFormWidget(
                  controller: TextEditingController(),
                  hintText: 'Cari lokasi jemput',
                ),
              ],
            ),
          ),
          Gap.w16,
        ],
      ),
    );
  }
}
