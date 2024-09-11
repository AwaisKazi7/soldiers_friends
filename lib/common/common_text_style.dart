import 'package:flutter/material.dart';
import 'common_colors.dart';

class CommonTextStyle {
  static const String fontFamilyName = "Poppins";
  //Common Button style
  static const TextStyle getstartedb1Style = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CommonColors.backgroundColor,
    fontFamily: fontFamilyName,
  );
  static const TextStyle getstartedb2Style = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CommonColors.primaryColor,
    fontFamily: fontFamilyName,
  );
  static const TextStyle commonButtonStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CommonColors.primaryColor,
    fontFamily: fontFamilyName,
  );
  static const TextStyle getstartedt1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: CommonColors.neutralGray,
    fontFamily: fontFamilyName,
  );
  static const TextStyle getstartedt2 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: CommonColors.darkGreen,
    fontFamily: fontFamilyName,
  );
  static const TextStyle splashtitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    fontFamily: fontFamilyName,
  );
  static const TextStyle splashheadline1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CommonColors.blackColor,
    fontFamily: fontFamilyName,
  );

  static const TextStyle welcomelogin = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 40,
    color: CommonColors.blackColor,
    fontFamily: fontFamilyName,
  );
  static TextStyle get gradienttext => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        foreground: Paint()
          ..shader = CommonColors.createGradientShader(
              const Rect.fromLTWH(0, 0, 300, 70)),
        fontFamily: fontFamilyName,
      );
}
