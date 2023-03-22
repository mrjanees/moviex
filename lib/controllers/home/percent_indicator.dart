import 'package:flutter/material.dart';
import 'package:mspot/core/colors/percent_indicator_colors.dart';

class PercentIndicatorController {
  static Color percentColor(int percent) {
    if (percent <= 25) {
      return PercentIndicatorColor.quarterPercent;
    } else if (percent <= 50) {
      return PercentIndicatorColor.halfPercent;
    } else if (percent <= 75) {
      return Color.fromARGB(255, 173, 255, 59);
    } else if (percent <= 100) {
      return PercentIndicatorColor.aboveThreeQuarters;
    } else {
      print('PercentIndicator Error');
      return Colors.black;
    }
  }
}
