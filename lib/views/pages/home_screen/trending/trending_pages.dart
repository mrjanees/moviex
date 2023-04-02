import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/home_screen/home_screen.dart';
import 'package:mspot/views/pages/home_screen/trending/all.dart';
import 'package:mspot/views/pages/home_screen/trending/movie.dart';
import 'package:mspot/views/pages/home_screen/trending/person.dart';
import 'package:mspot/views/pages/home_screen/trending/tv.dart';

import '../../../../controllers/home/trending/trending.dart';

List trendingPages = [
  const All(),
  const Movie(),
  const Tv(),
  const Person(),
];

class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => trendingPages[homecontrollers.categoryIdex.value]);
  }
}
