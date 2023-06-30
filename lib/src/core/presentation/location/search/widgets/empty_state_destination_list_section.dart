import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class EmptyStateDestinationListSection extends StatelessWidget {
  const EmptyStateDestinationListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SavedAddressDestinationSection(),
        Gap.h20,
        PaddingWidget(
          child: Row(
            children: [
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
                      'Nah, perginya pakai Gojek aja!',
                      style: TypographyApp.headline2,
                    ),
                    Gap.h8,
                    Text(
                      'Tinggal duduk sambil nikmatin peandangan sampai tujuan.',
                      style: TypographyApp.subText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
