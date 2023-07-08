import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';

class PickupDestinationSection extends ConsumerWidget {
  const PickupDestinationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mapControllerProvider);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          color: ColorApp.white,
          boxShadow: kElevationToShadow[1],
        ),
        padding: EdgeInsets.all(SizeApp.w12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PickupSection(state: state),
                  Gap.h8,
                  const Divider(
                    color: ColorApp.lightGrey,
                    height: 0,
                    thickness: 1,
                    indent: 32,
                  ),
                  Gap.h8,
                  DestinationSection(state: state),
                ],
              ),
            ),
            Gap.w8,
            const AddRouteButton(),
          ],
        ),
      ),
    );
  }
}
