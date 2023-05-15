import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mspot/models/person_Info_screen/person_model/person_model.dart';
import 'package:mspot/models/person_Info_screen/person_movie_credits/cast.dart';
import 'package:mspot/models/person_Info_screen/person_movie_credits/crew.dart';
import 'package:mspot/services/person_info_screen_api/implementation.dart';
import 'package:mspot/utils/dioerror_message.dart';

import '../../views/dialogs/loding_circle.dart';

class PersonInfoController extends GetxController {
  PersonInfoController.internal();
  static PersonInfoController instance = PersonInfoController.internal();
  PersonInfoController factory() {
    return instance;
  }

  var personInfoData = PersonInfoModel().obs;
  var departmentCategoryIndex = 0.obs;
  List<Cast> personMovieCredits = <Cast>[].obs;
  List<Cast> actingList = <Cast>[].obs;
  List<Crew> directingList = <Crew>[].obs;
  List<Crew> writingList = <Crew>[].obs;
  List<Crew> crewList = <Crew>[].obs;

  Future<void> personInfo(int id) async {
    loadingCircle();
    await personMovieInfo(id);
    final response = await PersonInfoApiImple().personInfo(id);
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        print('Person Info is null');
      } else {
        personInfoData.value = r;
        Get.back();
      }
    });

    Get.toNamed('/personInfo');
  }

  Future<void> personMovieInfo(int id) async {
    await actingdepartMents(id);
    final response = await PersonInfoApiImple().personMovieCredit(id);
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        print('Person Info is null');
      } else {
        personMovieCredits.clear();
        personMovieCredits.addAll(r);
      }
    });
  }

  Future<void> actingdepartMents(int id) async {
    await crewDepartment(id);
    final response = await PersonInfoApiImple().departments(id);
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        print('Department Info is null');
      } else {
        // Acting Department
        actingList.clear();
        r.cast!.sort((a, b) {
          DateTime? aDate =
              a.releaseDate == '' ? null : parseDate(a.releaseDate!);
          DateTime? bDate =
              b.releaseDate == '' ? null : parseDate(b.releaseDate!);
          if (aDate == null && bDate == null) {
            return 0;
          } else if (aDate == null) {
            return -1;
          } else if (bDate == null) {
            return 1;
          } else {
            return bDate.compareTo(aDate);
          }
        });
        actingList.addAll(r.cast!);
      }
    });
  }

  Future<void> crewDepartment(int id) async {
    await directingDepartment(id);
    final response = await PersonInfoApiImple().departments(id);
    response.fold(
      (l) => DioErrorTypeMessage.toShowErrorMessage(l),
      (r) {
        if (r == null) {
          log('CrewDepartment is null');
        } else {
          if (r.crew != null) {
            crewList.clear();
            r.crew!.forEach(
              (crew) {
                if (crew.department == 'Crew') {
                  crewList.add(crew);
                }
              },
            );

            crewList.sort((a, b) {
              DateTime? aDate =
                  a.releaseDate == '' ? null : parseDate(a.releaseDate!);
              DateTime? bDate =
                  b.releaseDate == '' ? null : parseDate(b.releaseDate!);
              if (aDate == null && bDate == null) {
                return 0;
              } else if (aDate == null) {
                return -1;
              } else if (bDate == null) {
                return 1;
              } else {
                return bDate.compareTo(aDate);
              }
            });
          }
        }
      },
    );
  }

  Future<void> directingDepartment(int id) async {
    await writingDepartment(id);
    final response = await PersonInfoApiImple().departments(id);
    response.fold(
      (l) => DioErrorTypeMessage.toShowErrorMessage(l),
      (r) {
        if (r == null) {
          log('DirectingDepartment is null');
        } else {
          if (r.crew != null) {
            directingList.clear();
            for (var crew in r.crew!) {
              if (crew.department == 'Directing') {
                directingList.add(crew);
              }
            }

            directingList.sort((a, b) {
              DateTime? aDate =
                  a.releaseDate == '' ? null : parseDate(a.releaseDate!);
              DateTime? bDate =
                  b.releaseDate == '' ? null : parseDate(b.releaseDate!);
              if (aDate == null && bDate == null) {
                return 0;
              } else if (aDate == null) {
                return -1;
              } else if (bDate == null) {
                return 1;
              } else {
                return bDate.compareTo(aDate);
              }
            });
          }
        }
      },
    );
  }

  Future<void> writingDepartment(int id) async {
    final response = await PersonInfoApiImple().departments(id);
    response.fold(
      (l) => DioErrorTypeMessage.toShowErrorMessage(l),
      (r) {
        if (r == null) {
          log('WritingDepartment is null');
        } else {
          if (r.crew != null) {
            writingList.clear();
            for (var crew in r.crew!) {
              if (crew.department == 'Writing') {
                writingList.add(crew);
              }
            }
            writingList.sort((a, b) {
              DateTime? aDate =
                  a.releaseDate == '' ? null : parseDate(a.releaseDate!);
              DateTime? bDate =
                  b.releaseDate == '' ? null : parseDate(b.releaseDate!);
              if (aDate == null && bDate == null) {
                return 0;
              } else if (aDate == null) {
                return -1;
              } else if (bDate == null) {
                return 1;
              } else {
                return bDate.compareTo(aDate);
              }
            });
          }
        }
      },
    );
  }

  void departmentCategoryChange(int index) {
    departmentCategoryIndex.value = index;
  }
}

DateTime parseDate(String dateStr) {
  return DateTime.parse(dateStr);
}
