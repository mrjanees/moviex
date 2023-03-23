import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/controllers/home/home_controllers.dart';
import 'package:mspot/core/Font_style.dart';
import 'package:mspot/core/trending_category.dart';
import 'package:mspot/views/pages/home_screen/home_screen.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 35,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: trendingCategory.length,
          itemBuilder: (context, index) {
            final category = trendingCategory[index];
            return GestureDetector(
                onTap: () => homecontrollers.onCategoryChanged(index),
                child: Obx(
                  () => AnimatedContainer(
                    margin: const EdgeInsets.all(5),
                    width: category.length <= 3 ? 50 : 60,
                    decoration: BoxDecoration(
                        color: homecontrollers.categoryIdex.value == index
                            ? ROSE_COLOR
                            : LOW_OPACITY_WHITE,
                        borderRadius: BorderRadius.circular(20)),
                    duration: const Duration(milliseconds: 300),
                    child: Center(
                        child: Text(
                      category,
                      style: MoviexFontStyle.categoryStyle(),
                    )),
                  ),
                ));
          }),
    );
  }
}
