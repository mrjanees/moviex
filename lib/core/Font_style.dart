import 'package:flutter/material.dart';

import 'colors/app_color.dart';

class MoviexFontStyle {
  static TextStyle heading1() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: WHITE_COLOR);
  }

  static TextStyle heading2() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: WHITE_COLOR);
  }

  static TextStyle personInfoName() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: WHITE_COLOR);
  }

  static TextStyle textUnderHeading1() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: WHITE_COLOR);
  }

  static TextStyle textUnderHeading2() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: WHITE_COLOR);
  }

  static TextStyle categoryStyle() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: WHITE_COLOR);
  }

  static TextStyle percentIndicator(double size) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: WHITE_COLOR,
    );
  }

  static TextStyle movieInfoFont() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: WHITE_COLOR);
  }

  static TextStyle homeScreenAnimH1() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: WHITE_COLOR);
  }

  static TextStyle homeScreenAnimH2() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 23,
        fontWeight: FontWeight.w200,
        color: WHITE_COLOR);
  }

  static TextStyle homeScreenAnimH3() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: WHITE_COLOR);
  }
}
