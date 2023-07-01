import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class DestinationPage extends StatelessWidget {
  const DestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
