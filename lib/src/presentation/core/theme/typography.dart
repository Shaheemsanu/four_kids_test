import 'package:flutter/material.dart';
import 'package:fourkids/src/presentation/core/theme/size_utils.dart';

import 'colors.dart';

class FontUtils {
  static TextStyle getFont8Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(8),
        fontFamily: "Fredoka",
        fontWeight: fontWeight);
  }

  static TextStyle getFont10Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(10),
        fontFamily: "Fredoka",
        fontWeight: fontWeight);
  }

  static TextStyle getFont12Style(
      {Color color = AppColors.white,
      TextDecoration decoration = TextDecoration.none,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(12),
        fontFamily: "Fredoka",
        decoration: decoration,
        decorationThickness: SizeUtils.getHeight(1),
        fontWeight: fontWeight);
  }

  static TextStyle getFont14Style(
      {Color color = AppColors.white,
      double letterSpacing = 0,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        letterSpacing: letterSpacing,
        color: color,
        fontSize: SizeUtils.getFont(14),
        fontFamily: "Fredoka",
        fontWeight: fontWeight);
  }

  static TextStyle getFont16Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700,
      TextDecoration decoration = TextDecoration.none}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(16),
        fontFamily: "Fredoka",
        fontWeight: fontWeight,
        decoration: decoration);
  }

  static TextStyle getFont18Style(
      {Color color = AppColors.white,
      TextDecoration decoration = TextDecoration.none,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(18),
        fontFamily: "Fredoka",
        decoration: decoration,
        fontWeight: fontWeight);
  }

  static TextStyle getFont20Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(20),
        fontFamily: "Fredoka",
        fontWeight: fontWeight);
  }

  static TextStyle getFont24Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(24),
        fontFamily: "Fredoka",
        fontWeight: fontWeight);
  }

  static TextStyle getFont32Style(
      {Color color = AppColors.black,
      FontWeight fontWeight = FontWeight.w600}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(32),
        fontFamily: "Fredoka",
        fontWeight: fontWeight);
  }

  static TextStyle getFont36Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w600}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(36),
        fontFamily: "Fredoka",
        fontWeight: fontWeight);
  }

  static TextStyle getFont48HomeStyle(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(48),
        fontFamily: "Home Gold",
        fontWeight: fontWeight);
  }

  static TextStyle getFont48Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w100}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(48),
        fontFamily: "Fredoka",
        fontWeight: fontWeight);
  }
}
