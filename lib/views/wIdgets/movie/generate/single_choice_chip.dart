import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors/app_color.dart';
import '../../../../core/movie_generater/data.dart';
import 'select_language.dart';

class SingleLanguageChip extends StatefulWidget {
  const SingleLanguageChip({super.key});

  @override
  State<SingleLanguageChip> createState() => _SingleLanguageChipState();
}

class _SingleLanguageChipState extends State<SingleLanguageChip> {
  @override
  Widget build(BuildContext context) {
    return ChipsChoice<int>.single(
      value: movieIndex,
      onChanged: (val) => setState(() => movieIndex = val),
      choiceItems: C2Choice.listFrom<int, String>(
        source: GeneratePopUpValues.languages,
        value: (i, v) => i,
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
