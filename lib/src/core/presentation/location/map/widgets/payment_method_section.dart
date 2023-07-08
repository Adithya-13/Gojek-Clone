import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tunai',
              style: TypographyApp.text1,
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 12,
            ),
          ],
        ),
        Gap.h4,
        Text(
          'Lihat opsi lebih murah',
          style: TypographyApp.subText1,
        ),
      ],
    );
  }
}
