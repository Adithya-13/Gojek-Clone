import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/core/core.dart';

class TransportationsSection extends StatelessWidget {
  const TransportationsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
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
                    const TransportationListWidget(),
                  ],
                ),
              ));
        });
  }
}
