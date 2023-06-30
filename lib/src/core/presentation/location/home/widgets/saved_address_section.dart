import 'package:flutter/material.dart';
import 'package:gojek_clone/src/constants/constants.dart';
import 'package:gojek_clone/src/widgets/widgets.dart';

class SavedAddressSection extends StatelessWidget {
  const SavedAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.bookmark_add,
          color: ColorApp.lightGreen,
          size: SizeApp.w32,
        ),
        Gap.h20,
        Text(
          'Simpan alamat, pesan lebih cepat',
          style: TypographyApp.headline2,
        ),
        Gap.h12,
        Text(
          'Ada alamat yang sering dipakai? Simpan yuk, biar gak ribet ketik alamat lagi.',
          style: TypographyApp.subText2,
          textAlign: TextAlign.center,
        ),
        Gap.h32,
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
      ],
    );
  }
}
