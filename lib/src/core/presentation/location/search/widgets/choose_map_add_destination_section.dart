import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class ChooseMapAddDestinationSection extends StatelessWidget {
  const ChooseMapAddDestinationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonWidget(
          icon: Icons.map_rounded,
          color: ColorApp.green,
          title: 'Pilih lewat peta',
        ),
        ButtonWidget(
          icon: Icons.add_circle_rounded,
          color: ColorApp.red,
          title: 'Tambah tujuan',
        ),
      ],
    );
  }
}
