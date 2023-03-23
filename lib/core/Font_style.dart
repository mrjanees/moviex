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

  static TextStyle categoryStyle() {
    return const TextStyle(
        fontFamily: 'inter',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: WHITE_COLOR);
  }

  static TextStyle percentIndicator() {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: WHITE_COLOR,
    );
  }
}
