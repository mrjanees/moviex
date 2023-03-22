import 'package:flutter/material.dart';
import 'package:mspot/controllers/home/percent_indicator.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentInticator extends StatelessWidget {
  int percent;

  PercentInticator({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 22,
      lineWidth: 8,
      percent: percent * 0.01,
      progressColor: PercentIndicatorController.percentColor(percent),
      backgroundColor: Colors.white54,
      circularStrokeCap: CircularStrokeCap.round,
      center: Center(
        child: Text(
          '$percent%',
          style: MoviexFontStyle.percentIndicator(),
        ),
      ),
    );
  }
}
