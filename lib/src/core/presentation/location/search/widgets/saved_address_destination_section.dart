import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class SavedAddressDestinationSection extends StatelessWidget {
  const SavedAddressDestinationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap.h16,
        SizedBox(
          height: 40,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return const SavedAddressItemWidget(title: 'Home');
            },
          ),
        ),
        Gap.h32,
        const Divider(
          color: ColorApp.grey,
          endIndent: 0,
          indent: 0,
          thickness: 1,
          height: 0,
        ),
        const Divider(
          color: ColorApp.lightGrey,
          endIndent: 0,
          indent: 0,
          thickness: 16,
          height: 0,
        ),
      ],
    );
  }
}
