import 'package:flutter/material.dart';
import 'package:mspot/core/colors/percent_indicator_colors.dart';

class PercentIndicatorController {
  static String numberConversion(double value) {
    final doublevote = value * 10;
    final vote = doublevote.truncate();
    return vote.toString();
  }

  static Color percentColor(double value) {
    final doublevote = value * 10;
    final percent = doublevote.truncate();

    if (percent <= 25) {
      return PercentIndicatorColor.quarterPercent;
    } else if (percent <= 50) {
      return const Color.fromARGB(255, 255, 186, 59);
    } else if (percent <= 75) {
      return const Color.fromARGB(255, 242, 255, 59);
    } else if (percent >= 75) {
      return const Color.fromARGB(255, 34, 255, 0);
    } else {
      return Colors.black;
    }
  }
}
