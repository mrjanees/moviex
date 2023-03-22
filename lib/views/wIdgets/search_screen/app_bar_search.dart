import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/Font_style.dart';
import '../../../core/colors/app_color.dart';

class AppbarSearch extends StatelessWidget {
  const AppbarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      style: const TextStyle(color: WHITE_COLOR),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ELEMENT_COLOR),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: WHITE_COLOR),
              borderRadius: BorderRadius.circular(30)),
          hintText: 'search',
          hintStyle: MoviexFontStyle.categoryStyle(),
          fillColor: ELEMENT_COLOR,
          prefixIcon: SvgPicture.asset(
            'assets/icons/search.svg',
            height: 30,
            width: 30,
            fit: BoxFit.scaleDown,
            colorFilter: const ColorFilter.mode(WHITE_COLOR, BlendMode.srcIn),
          ),
          filled: true,
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none)),
    );
  }
}
