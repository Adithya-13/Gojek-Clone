
import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/shared/extensions/extensions.dart';

class LocationCardWidget extends StatelessWidget {
  const LocationCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeApp.h16),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: ColorApp.grey,
                ),
                padding: EdgeInsets.all(SizeApp.h4),
                child: Icon(
                  Icons.location_pin,
                  color: ColorApp.white,
                  size: SizeApp.h16,
                ),
              ),
              Gap.h20,
              Text(
                '12,3 km',
                style: TypographyApp.subText2.grey,
              ),
            ],
          ),
          Gap.w16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sindangkasih, Majalengka',
                  style: TypographyApp.headline2,
                ),
                Gap.h8,
                Text(
                  'Perum Sindangkasih, Blok A No. 4, Jl. Semar, RT.33 / RW.17, Desa Sindangkasih, Majalengka, Jawa Barat 45412',
                  style: TypographyApp.subText2.fontSizeCustom(10),
                ),
              ],
            ),
          ),
          Gap.w16,
          const Icon(
            Icons.bookmark_rounded,
            color: ColorApp.grey,
          ),
        ],
      ),
    );
  }
}
