
import 'package:flutter/material.dart';
import 'package:gojek_clone/src/core/core.dart';

class LocationListSection extends StatelessWidget {
  const LocationListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const LocationCardWidget();
        },
      ),
    );
  }
}
