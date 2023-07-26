import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/gen/fonts.gen.dart';
import 'package:gojek_clone/src/constants/constants.dart';

/// [INFO]
/// All of the Typography in your App
class TypographyApp {
  static TextStyle headline1 = TextStyle(
    fontFamily: FontFamily.sFPro,
    fontSize: ScreenUtil().setSp(18),
    fontWeight: FontWeight.w700,
    color: ColorApp.black,
  );

  static TextStyle headline2 = TextStyle(
    fontFamily: FontFamily.sFPro,
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w700,
    color: ColorApp.black,
  );

  static TextStyle text1 = TextStyle(
    fontFamily: FontFamily.sFPro,
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w600,
    color: ColorApp.black,
  );

  static TextStyle text2 = TextStyle(
    fontFamily: FontFamily.sFPro,
    fontSize: ScreenUtil().setSp(14),
    fontWeight: FontWeight.w400,
    color: ColorApp.black,
  );

  static TextStyle subText1 = TextStyle(
    fontFamily: FontFamily.sFPro,
    fontSize: ScreenUtil().setSp(12.5),
    fontWeight: FontWeight.w600,
    color: ColorApp.black,
  );

  static TextStyle subText2 = TextStyle(
    fontFamily: FontFamily.sFPro,
    fontSize: ScreenUtil().setSp(12.5),
    fontWeight: FontWeight.w400,
    color: ColorApp.black,
  );
}
