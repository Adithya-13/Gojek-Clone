import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';

import 'dashed_line_vertical_painter.dart';

class VerticalDash extends StatelessWidget {
  final double? height;
  final Color? color;
  const VerticalDash({
    Key? key,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(1, height ?? double.infinity),
      painter: DashedLineVerticalPainter(color ?? ColorApp.grey),
    );
  }
}
