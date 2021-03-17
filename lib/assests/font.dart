import 'package:Armdeot/assests/color.dart';
import 'package:flutter/material.dart';

class FontStyle {
  static TextStyle small(bool light) {
    return TextStyle(
      fontSize: 10,
      color: light ? ColorTheme.fontLight : ColorTheme.fontDark,
    );
  }

  static TextStyle medium(bool light) {
    return TextStyle(
      fontSize: 12,
      color: light ? ColorTheme.fontLight : ColorTheme.fontDark,
    );
  }

  static TextStyle mediumBold(bool light) {
    return TextStyle(
      fontSize: 12,
      color: light ? ColorTheme.fontLight : ColorTheme.fontDark,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle normal(bool light) {
    return TextStyle(
      fontSize: 15,
      color: light ? ColorTheme.fontLight : ColorTheme.fontDark,
    );
  }

  static TextStyle normalBold(bool light) {
    return TextStyle(
      fontSize: 15,
      color: light ? ColorTheme.fontLight : ColorTheme.fontDark,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle large(bool light) {
    return TextStyle(
      fontSize: 20,
      color: light ? ColorTheme.fontLight : ColorTheme.fontDark,
    );
  }

  static TextStyle largeBold(bool light) {
    return TextStyle(
      fontSize: 20,
      color: light ? ColorTheme.fontLight : ColorTheme.fontDark,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle xlarge(bool light) {
    return TextStyle(
      fontSize: 25,
      color: light ? ColorTheme.fontLight : ColorTheme.fontDark,
    );
  }

  static TextStyle xlargeBold(bool light) {
    return TextStyle(
      fontSize: 25,
      color: light ? ColorTheme.fontLight : ColorTheme.fontDark,
      fontWeight: FontWeight.bold,
    );
  }
}

class FontFamily {}
