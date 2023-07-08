import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

import 'package:gojek_clone/src/constants/constants.dart';

class CircleDotWidget extends StatelessWidget {
  final bool withAnimation;
  final double? size;
  final double? innerSize;
  const CircleDotWidget({
    Key? key,
    this.withAnimation = false,
    this.size,
    this.innerSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return withAnimation
        ? RippleAnimation(
            color: ColorApp.red,
            delay: const Duration(milliseconds: 1000),
            repeat: true,
            minRadius: 12,
            ripplesCount: 1,
            duration: const Duration(milliseconds: 1500),
            child: _CircleDotContainer(
              size: size,
              innerSize: innerSize,
            ),
          )
        : _CircleDotContainer(
            size: size,
            innerSize: innerSize,
          );
  }
}

class _CircleDotContainer extends StatelessWidget {
  final double? size;
  final double? innerSize;
  const _CircleDotContainer({
    Key? key,
    this.size,
    this.innerSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorApp.red,
        shape: BoxShape.circle,
      ),
      width: size ?? 28,
      height: size ?? 28,
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: ColorApp.white,
            shape: BoxShape.circle,
          ),
          width: innerSize ?? 8,
          height: innerSize ?? 8,
        ),
      ),
    );
  }
}
