import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors/app_color.dart';
import '../../../../core/movie_generater/data.dart';

List<String> val = [];

class MultiChoiceChip extends StatefulWidget {
  const MultiChoiceChip({super.key});

  @override
  State<MultiChoiceChip> createState() => _SingleLanguageChipState();
}

class _SingleLanguageChipState extends State<MultiChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return ChipsChoice<String>.multiple(
      value: val,
      onChanged: (value) => setState(() => val = value),
      choiceItems: C2Choice.listFrom<String, String>(
        source: GeneratePopUpValues.genres,
        value: (i, v) => v,
        label: (i, v) => v,
      ),
      wrapped: true,
      choiceActiveStyle: C2ChoiceStyle(
          backgroundColor: ROSE_COLOR,
          color: WHITE_COLOR,
          borderRadius: BorderRadius.circular(20)),
      choiceStyle: C2ChoiceStyle(
          backgroundColor: BACKGROUND_COLOR,
          color: WHITE_COLOR,
          borderColor: BACKGROUND_COLOR,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
