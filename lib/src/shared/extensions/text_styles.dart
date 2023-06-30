import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gojek_clone/src/constants/constants.dart';

extension XTextStyle on TextStyle {
  /// [INFO]
  /// Extension for change font weight
  ///
  /// Example:
  /// TypographyTheme.subtitle1.thin;
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get extraBlack => copyWith(fontWeight: FontWeight.w900);

  /// [INFO]
  /// Extension for change color
  ///
  /// Example:
  /// TypographyTheme.subtitle1.darkGrey;
  TextStyle get black => copyWith(color: ColorApp.black);
  TextStyle get darkGrey => copyWith(color: ColorApp.darkGrey);
  TextStyle get grey => copyWith(color: ColorApp.grey);
  TextStyle get white => copyWith(color: ColorApp.white);
  TextStyle get darkGreen => copyWith(color: ColorApp.darkGreen);
  TextStyle get green => copyWith(color: ColorApp.green);
  TextStyle get darkBlue => copyWith(color: ColorApp.darkBlue);
  TextStyle get blue => copyWith(color: ColorApp.blue);
  TextStyle get lightBlue => copyWith(color: ColorApp.lightBlue);
  TextStyle get red => copyWith(color: ColorApp.red);
  TextStyle get purple => copyWith(color: ColorApp.purple);

  /// [INFO]
  /// Extension for change font size
  ///
  /// Example:
  /// TypographyTheme.subtitle1.fontSize(20);
  TextStyle fontSizeCustom(double size) => copyWith(fontSize: size.sp);

  /// [INFO]
  /// Extension for change font color
  ///
  /// Example:
  /// TypographyTheme.subtitle1.fontcopyWith(color: ColorApp.))ColorApp.black);
  TextStyle fontColor(Color color) => copyWith(color: color);

  /// [INFO]
  /// Extension for change font style and decoration
  ///
  /// Example:
  /// TypographyTheme.subtitle1.underline;
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  /// [INFO]
  /// Extension for change font height and letter spacing
  ///
  /// Example
  /// TypographyTheme.customHeight(2);
  /// or
  /// TypographyTheme.customLetterSpacing(2);
  TextStyle customHeight(double value) => copyWith(height: value.h);
  TextStyle customSpacing(double value) => copyWith(letterSpacing: value.w);
}
