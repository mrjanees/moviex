import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/search/search_controllers.dart';
import 'package:mspot/models/search_screen/search_result/search_result.dart';
import 'package:mspot/views/dialogs/loding_circle.dart';

import '../../../core/Font_style.dart';
import '../../../core/colors/app_color.dart';

TextEditingController searchTextController = TextEditingController();

class AppbarSearch extends StatelessWidget {
  final searchController = Get.put(SearchControllers());

  AppbarSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTextController,
      onSubmitted: (value) async {
        loadingCircle();
        await searchController.searchMovie(value);
        if (searchController.searchResultList.isNotEmpty) {
          Navigator.of(Get.overlayContext!).pop();
          print(searchController.searchResultList.length);
        }
      },
      textInputAction: TextInputAction.search,
      style: const TextStyle(color: WHITE_COLOR),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ELEMENT_COLOR),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: WHITE_COLOR),
              borderRadius: BorderRadius.circular(30)),
          hintText: 'Search',
          hintStyle: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: WHITE_COLOR),
          fillColor: ELEMENT_COLOR,
          suffixIcon: IconButton(
            icon: const Icon(Icons.cancel_outlined),
            onPressed: () => searchTextController.clear(),
            color: FADE_WHITE,
            iconSize: 25,
          ),
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
