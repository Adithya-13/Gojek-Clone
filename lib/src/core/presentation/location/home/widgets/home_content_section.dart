import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/extensions/extensions.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class HomeContentSection extends StatelessWidget {
  const HomeContentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PaddingWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap.h12,
              Text(
                'Gojek Clone - GoRide',
                style: TypographyApp.headline1.white,
              ),
              Gap.customGapHeight(
                context.screenHeightPercentage(0.06),
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
            ],
          ),
        ),
      ),
    );
  }
}
