import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/person_info/person_info_controller.dart';
import '../../../../pages/person_info_screen.dart';
import '../../department_card.dart';

class WritingDepartment extends StatelessWidget {
  WritingDepartment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    return Obx(() => personInfoController.writingList.isEmpty
        ? const SizedBox(
            height: 100,
            child: Center(
                child: Text(
              'No items',
              style: TextStyle(color: Colors.grey),
            )),
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              final credits = personInfoController.writingList[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: DepartmentCard(
                  id: credits.id!,
                  title: credits.title,
                  job: credits.job,
                  poster: credits.posterPath,
                  releaseDate: credits.releaseDate,
                ),
              );
            },
            itemCount: personInfoController.writingList.length,
          ));
  }
}
