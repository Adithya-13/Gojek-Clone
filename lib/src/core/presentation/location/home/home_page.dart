import 'package:flutter/material.dart';
import 'package:gojek_clone/gen/assets.gen.dart';
import 'package:gojek_clone/src/core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            child: Assets.svgs.bgHome.svg(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              alignment: Alignment.topCenter,
            ),
          ),
          const Positioned.fill(
            child: HomeContentSection(),
          ),
        ],
      ),
    );
  }
}
