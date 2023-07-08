import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationMapSection extends ConsumerWidget {
  const CurrentLocationMapSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);
    final position = state.userLocation;

    if (state.isLoading) {
      return const SizedBox(
        height: 140,
        child: Center(
          child: LoadingWidget(),
        ),
      );
    } else if (position == null) {
      return const SizedBox();
    }

    return SizedBox(
      height: 140,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 14.4746,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
        ),
      ),
    );
  }
}
