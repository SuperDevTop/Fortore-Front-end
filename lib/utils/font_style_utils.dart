import 'package:flutter/material.dart';

/// THIS ENUM IS USED TO MANAGE FONT_WEIGHT...
enum FWT {
  light,
  regular,
  medium,
  semiBold,
  bold,
}

/// THIS CLASS IS USED TO MANAGE FONT_STYLES USED IN THE APPLICATION...
class FontStyleUtilities {
  /// THIS FUINCTION RETURNS FONT_WEIGHT ACCORDING TO USER REQUIREMENT(FROM ENUM)...
  static FontWeight getFontWeight({FWT fontWeight = FWT.regular}) {
    switch (fontWeight) {
      case FWT.bold:
        return FontWeight.w700;
      case FWT.semiBold:
        return FontWeight.w600;
      case FWT.medium:
        return FontWeight.w500;
      case FWT.regular:
        return FontWeight.w400;
      case FWT.light:
        return FontWeight.w300;
      default:
        return FontWeight.w400;
    }
  }

  /// FONTSTYLE FOR FONT SIZE 34
  static TextStyle f34({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 34,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 30
  static TextStyle f30({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 30,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 30
  static TextStyle f28({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 28,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 24
  static TextStyle f24({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 24,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 20
  static TextStyle f20({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 20,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 18
  static TextStyle f18({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 18,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 17
  static TextStyle f17({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 17,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 16
  static TextStyle f16({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 16,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 15
  static TextStyle f15({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 15,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 14
  static TextStyle f14({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 14,
      fontFamily: "verdana"
    );
  }

  /// FONTSTYLE FOR FONT SIZE 13
  static TextStyle f13({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 13,
      fontFamily: "verdana"
    );
  }

  /// FONTSTYLE FOR FONT SIZE 12
  static TextStyle f12({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 12,
    );
  }

  /// FONTSTYLE FOR FONT SIZE 11
  static TextStyle f11({
    required Color fontColor,
    FWT? fontWeight,
  }) {
    return TextStyle(
      color: fontColor,
      fontWeight: getFontWeight(fontWeight: fontWeight!),
      fontSize: 11,
    );
  }
}
