import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';

class LocationCardWidget extends ConsumerWidget {
  final AutocompletePrediction prediction;
  const LocationCardWidget({
    Key? key,
    required this.prediction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(destinationControllerProvider.notifier);
    return GestureDetector(
      onTap: () {
        controller.onPredictionTap(prediction);
      },
      child: Container(
        padding: EdgeInsets.all(SizeApp.h16),
        color: ColorApp.white,
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
                  '${(prediction.distanceMeters ?? 0) / 1000} km',
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
                    prediction.primaryText,
                    style: TypographyApp.headline2,
                  ),
                  Gap.h8,
                  Text(
                    prediction.secondaryText,
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
      ),
    );
  }
}
