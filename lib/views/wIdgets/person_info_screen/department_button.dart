import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/person_info_screen.dart';

import '../../../core/Font_style.dart';
import '../../../core/colors/app_color.dart';
import '../../../core/department_category.dart';

class DepartmentCategoryButton extends StatelessWidget {
  const DepartmentCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: departmentCategory.length,
          itemBuilder: (context, index) {
            final category = departmentCategory[index];
            return GestureDetector(
                onTap: () =>
                    personInfoController.departmentCategoryChange(index),
                child: Obx(
                  () => AnimatedContainer(
                    margin: const EdgeInsets.all(5),
                    width: category.length <= 3
                        ? 50
                        : category.length < 7
                            ? 70
                            : 80,
                    decoration: BoxDecoration(
                        color: personInfoController
                                    .departmentCategoryIndex.value ==
                                index
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
