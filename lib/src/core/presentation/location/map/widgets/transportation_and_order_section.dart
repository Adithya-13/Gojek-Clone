import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojek_clone/src/core/core.dart';

class TransportationAndOrderSection extends StatelessWidget {
  const TransportationAndOrderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: TransportationsSection(),
        ),
        OrderButtonSection(),
      ],
    );
  }
}
