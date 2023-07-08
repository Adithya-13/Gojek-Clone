import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';

class TransportationItemWidget extends StatelessWidget {
  final Transportation transportation;
  final double distance;
  const TransportationItemWidget({
    super.key,
    required this.transportation,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: SizeApp.h20),
          child: Row(
            children: [
              Gap.w16,
              Container(
                height: SizeApp.h72,
                width: SizeApp.h72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: ColorApp.pink,
                ),
              ),
              Gap.w16,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transportation.title,
                      style: TypographyApp.headline1.black,
                    ),
                    Gap.h8,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${transportation.etaStart.toInt()}-${transportation.etaEnd.toInt()} menit',
                          style: TypographyApp.subText2,
                        ),
                        Gap.w4,
                        const Icon(
                          Icons.person_rounded,
                          color: ColorApp.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap.w16,
              Text(
                transportation.price(distance).toRupiah(),
                style: TypographyApp.headline1.black,
              ),
              Gap.w16,
            ],
          ),
        ),
        Divider(
          color: ColorApp.lightGrey,
          height: 0,
          thickness: 1,
          indent: context.screenWidth - context.screenWidthPercentage(0.8),
        ),
      ],
    );
  }
}
