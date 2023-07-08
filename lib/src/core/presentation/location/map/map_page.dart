import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as places;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';
import 'package:gojek_clone/src/shared/shared.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends ConsumerStatefulWidget {
  final places.Place pickup;
  final places.Place destination;
  const MapPage({
    Key? key,
    required this.pickup,
    required this.destination,
  }) : super(key: key);

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  MapController get controller => ref.read(mapControllerProvider.notifier);
  MapState get state => ref.watch(mapControllerProvider);
  late final CameraPosition cameraPosition;

  @override
  void initState() {
    initCameraPosition();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init(widget.pickup, widget.destination);
    });
    super.initState();
  }

  void initCameraPosition() {
    cameraPosition = CameraPosition(
      target: LatLng(
        widget.pickup.latLng?.lat ?? 0,
        widget.pickup.latLng?.lng ?? 0,
      ),
      zoom: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: context.screenHeightPercentage(0.4),
            child: GoogleMap(
              gestureRecognizers: {
                Factory<PanGestureRecognizer>(() => PanGestureRecognizer())
              },
              zoomControlsEnabled: true,
              myLocationButtonEnabled: false,
              polylines: Set<Polyline>.of(state.polylines.values),
              onMapCreated: (mapController) {
                Future.delayed(
                  const Duration(milliseconds: 500),
                  () {
                    mapController.animateCamera(
                      CameraUpdate.newLatLngBounds(
                        MapUtils.boundsFromLatLngList(
                            state.markers.map((loc) => loc.position).toList()),
                        100,
                      ),
                    );
                    controller.getPolyline();
                  },
                );
              },
              initialCameraPosition: cameraPosition,
              markers: state.markers,
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 20,
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.r),
                  color: ColorApp.white,
                  boxShadow: kElevationToShadow[1],
                ),
                padding: EdgeInsets.all(SizeApp.w12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: ColorApp.green,
                                ),
                                padding: const EdgeInsets.all(2),
                                child: const Icon(
                                  Icons.arrow_upward_rounded,
                                  color: ColorApp.white,
                                  size: 16,
                                ),
                              ),
                              Gap.w12,
                              Expanded(
                                child: Text(
                                  state.pickup?.name ?? '',
                                  style: TypographyApp.headline2,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          Gap.h8,
                          const Divider(
                            color: ColorApp.lightGrey,
                            height: 0,
                            thickness: 1,
                            indent: 32,
                          ),
                          Gap.h8,
                          Row(
                            children: [
                              const CircleDotWidget(
                                withAnimation: false,
                                size: 20,
                                innerSize: 6,
                              ),
                              Gap.w12,
                              Expanded(
                                child: Text(
                                  state.destination?.name ?? '',
                                  style: TypographyApp.headline2,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gap.w8,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorApp.grey, width: 1),
                        borderRadius: BorderRadius.circular(36.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeApp.w12,
                        vertical: SizeApp.h8,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.add_circle_outline_rounded,
                            color: ColorApp.red,
                          ),
                          Gap.customGapWidth(2),
                          Text(
                            'Tambah',
                            style: TypographyApp.text1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: context.screenHeightPercentage(0.44) + 16,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: ColorApp.white,
                  shadows: kElevationToShadow[1],
                ),
                padding: EdgeInsets.all(SizeApp.h12),
                child: const Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: ColorApp.darkGrey,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: DraggableScrollableSheet(
                      initialChildSize: 0.24,
                      minChildSize: 0.24,
                      maxChildSize: 0.72,
                      snapSizes: const [0.24, 0.72],
                      snap: true,
                      builder: (BuildContext context, scrollSheetController) {
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.r),
                              ),
                              boxShadow: CupertinoContextMenu.kEndBoxShadow,
                              color: ColorApp.white,
                            ),
                            child: SingleChildScrollView(
                              controller: scrollSheetController,
                              physics: const ClampingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Gap.h20,
                                  Container(
                                    width: 28,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: ColorApp.grey,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: SizeApp.h20),
                                            child: Row(
                                              children: [
                                                Gap.w16,
                                                Container(
                                                  height: SizeApp.h72,
                                                  width: SizeApp.h72,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.r),
                                                    color: ColorApp.pink,
                                                  ),
                                                ),
                                                Gap.w16,
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'GoRide',
                                                        style: TypographyApp
                                                            .headline1.black,
                                                      ),
                                                      Gap.h8,
                                                      Text(
                                                        '1-4 menit',
                                                        style: TypographyApp
                                                            .subText2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Gap.w16,
                                                Text(
                                                  'Rp. 24.000',
                                                  style: TypographyApp
                                                      .headline1.black,
                                                ),
                                                Gap.w16,
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: ColorApp.lightGrey,
                                            height: 0,
                                            thickness: 1,
                                            indent: context.screenWidth -
                                                context
                                                    .screenWidthPercentage(0.8),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
                SafeArea(
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
                            Expanded(
                              child: Column(
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
                              ),
                            ),
                            Gap.w20,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(color: ColorApp.grey),
                              ),
                              padding: EdgeInsets.all(SizeApp.h4),
                              child: Text(
                                'Voucher',
                                style: TypographyApp.text1,
                              ),
                            ),
                            Gap.w12,
                            Container(
                              decoration: const ShapeDecoration(
                                shape: CircleBorder(
                                    side: BorderSide(
                                  color: ColorApp.grey,
                                )),
                                color: ColorApp.white,
                              ),
                              padding: EdgeInsets.all(SizeApp.h4),
                              child: const Icon(
                                Icons.add_box_rounded,
                                color: ColorApp.black,
                              ),
                            ),
                          ],
                        ),
                        Gap.h16,
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(20.r),
                                  ),
                                  color: ColorApp.blue,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeApp.h8,
                                  horizontal: SizeApp.w12,
                                ),
                                child: Text(
                                  'Voucher s.d. 10rb jika penjemputan tertunda',
                                  style: TypographyApp.subText1.white,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(20.r),
                                ),
                                color: ColorApp.darkBlue,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: SizeApp.h8,
                                horizontal: SizeApp.w36,
                              ),
                              child: Text(
                                'Cek',
                                style: TypographyApp.subText1.bold.white,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Gap.h16,
                        Row(
                          children: [
                            Container(
                              decoration: const ShapeDecoration(
                                shape: CircleBorder(
                                  side: BorderSide(
                                    color: ColorApp.darkGreen,
                                    width: 2,
                                  ),
                                ),
                                color: ColorApp.white,
                              ),
                              padding: EdgeInsets.all(SizeApp.h8),
                              child: const Icon(
                                Icons.date_range_rounded,
                                color: ColorApp.darkGreen,
                              ),
                            ),
                            Gap.w8,
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.r),
                                  color: ColorApp.darkGreen,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeApp.h8,
                                  horizontal: SizeApp.h16,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Pesan GoRide',
                                            style: TypographyApp.text1.white,
                                          ),
                                          Gap.h4,
                                          Text(
                                            'Bakal dapet 13 XP',
                                            style: TypographyApp.subText1.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Rp33.500',
                                      style: TypographyApp.headline1.white,
                                    ),
                                    Gap.w20,
                                    const Icon(
                                      Icons.arrow_circle_right_rounded,
                                      color: ColorApp.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
