import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/routes/routes.dart';
import 'package:gojek_clone/src/shared/shared.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class SearchLocationButton extends StatelessWidget {
  const SearchLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.destination.name);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.lightGrey,
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(
            color: ColorApp.grey,
          ),
        ),
        padding: EdgeInsets.all(
          SizeApp.h12,
        ),
        child: Row(
          children: [
            const CircleDotWidget(),
            Gap.w16,
            Expanded(
              child: Text(
                'Cari lokasi tujuan',
                style: TypographyApp.text2.grey,
              ),
            ),
            Gap.w16,
            const Icon(
              Icons.search_outlined,
              color: ColorApp.grey,
            ),
          ],
        ),
      ),
    );
  }
}
