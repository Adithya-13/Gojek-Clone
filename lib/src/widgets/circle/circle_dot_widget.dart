import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class CircleDotWidget extends StatelessWidget {
  final bool withAnimation;
  const CircleDotWidget({
    Key? key,
    this.withAnimation = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return withAnimation
        ? const RippleAnimation(
            color: ColorApp.red,
            delay: Duration(milliseconds: 1000),
            repeat: true,
            minRadius: 12,
            ripplesCount: 1,
            duration: Duration(milliseconds: 1500),
            child: _CircleDotContainer(),
          )
        : const _CircleDotContainer();
  }
}

class _CircleDotContainer extends StatelessWidget {
  const _CircleDotContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorApp.red,
        shape: BoxShape.circle,
      ),
      width: 28,
      height: 28,
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: ColorApp.white,
            shape: BoxShape.circle,
          ),
          width: 8,
          height: 8,
        ),
      ),
    );
  }
}
