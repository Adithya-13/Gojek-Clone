import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class HomeContentSection extends StatelessWidget {
  const HomeContentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Gap.h12,
          Text(
            'Gojek Clone - GoRide',
            style: TypographyApp.headline1.white,
          ),
          Gap.h12,
          Expanded(
            child: SingleChildScrollView(
              child: PaddingWidget(
                child: Column(
                  children: [
                    Gap.customGapHeight(
                      context.screenHeightPercentage(0.12),
                    ),
                    Text(
                      'Banyak bintang ya, Adithya',
                      style: TypographyApp.headline1.white,
                    ),
                    Gap.h8,
                    Text(
                      'Kalo gak ada, berarti bintangnya di matamu.',
                      style: TypographyApp.subText1.white,
                    ),
                    Gap.h20,
                    const ProtectionCardSection(),
                    Gap.h64,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
