import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class TopBarDestinationSection extends StatelessWidget {
  const TopBarDestinationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.close_rounded,
            color: ColorApp.black,
          ),
        ),
        Gap.w8,
        Text(
          'Mau ke mana hari ini?',
          style: TypographyApp.headline1,
        ),
      ],
    );
  }
}
