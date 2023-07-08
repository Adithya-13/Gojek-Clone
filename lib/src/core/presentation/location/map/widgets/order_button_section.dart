import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';

class OrderButtonSection extends StatelessWidget {
  const OrderButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ColorApp.grey,
              width: 1,
            ),
          ),
          color: ColorApp.white,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeApp.w16,
          vertical: SizeApp.w20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Expanded(
                  child: PaymentMethodSection(),
                ),
                Gap.w20,
                const VoucherButton(),
                Gap.w12,
                const ExtraButton(),
              ],
            ),
            Gap.h16,
            const VoucherIfDelayedSection(),
            Gap.h16,
            Row(
              children: [
                const ScheduledButton(),
                Gap.w8,
                const Expanded(
                  child: OrderButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
