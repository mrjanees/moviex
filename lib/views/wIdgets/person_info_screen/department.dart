import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/pages/person_info_screen.dart';
import 'package:mspot/views/wIdgets/person_info_screen/deaprtments/acting/acting_departments.dart';

import 'deaprtments/crew/crew_deaprtment.dart';
import 'deaprtments/directing/directing_department.dart';
import 'deaprtments/writing/writing_department.dart';

List departmentPages = [
  ActingDepartment(),
  CrewDepartment(),
  DirectingDepartment(),
  WritingDepartment()
];

class Departments extends StatelessWidget {
  const Departments({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        departmentPages[personInfoController.departmentCategoryIndex.value]);
  }
}
