import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/routes/routes.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class DestinationPage extends ConsumerWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// [INFO]
    /// when both pickup and destination is filled by place, it will automatically
    /// navigate into map page
    ref.listen(destinationControllerProvider, (previous, next) {
      if (previous?.pickup != next.pickup ||
          previous?.destination != next.destination) {
        if (next.destination != null && next.pickup != null) {
          context.pushNamed(
            Routes.map.name,
            extra: Extra(
              datas: {
                ExtrasKey.pickup: next.pickup,
                ExtrasKey.destination: next.destination,
              },
            ),
          );
        }
      }
    });

    return Scaffold(
      backgroundColor: ColorApp.white,
      body: SafeArea(
        child: Column(
          children: [
            Gap.h20,
            PaddingWidget(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TopBarDestinationSection(),
                  Gap.h20,
                  const DestinationFormSection(),
                  Gap.h20,
                  const ChooseMapAddDestinationSection(),
                ],
              ),
            ),
            Gap.h20,
            const Divider(
              color: ColorApp.grey,
              endIndent: 0,
              indent: 0,
              thickness: 1,
              height: 0,
            ),
            const LocationListSection(),
          ],
        ),
      ),
    );
  }
}
