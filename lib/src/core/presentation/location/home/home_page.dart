import 'package:flutter/material.dart';
import 'package:gojek_clone/gen/assets.gen.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/extensions/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -52,
            left: 0,
            right: 0,
            child: Assets.svgs.bgHome.svg(
                fit: BoxFit.fitHeight,
                height: context.screenHeightPercentage(0.6)),
          ),
          const Positioned.fill(
            child: HomeContentSection(),
          ),
        ],
      ),
    );
  }
}
