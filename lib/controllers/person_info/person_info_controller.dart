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
    await departMents(id);
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

  Future<void> departMents(int id) async {
    writingList.clear();
          directingList.clear();
          crewList.clear();
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

        // Crew Deaprtment
        if (r.crew == null) {
          print('Crew is null ');
        } else {
          
          r.crew!.forEach((crew) {
            if (crew.department == 'Crew') {
              r.crew!.sort((a, b) {
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
              crewList.addAll(r.crew!);
            }
          });

          r.crew!.forEach((crew) {
            if (crew.department == 'Directing') {
              r.crew!.sort((a, b) {
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
              directingList.addAll(r.crew!);
            }
          });

          r.crew!.forEach((crew) {
            if (crew.department == 'Writing') {
              r.crew!.sort((a, b) {
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
              writingList.addAll(r.crew!);
            }
          });
        }

        //Department Directing
      }
    });
  }

  void departmentCategoryChange(int index) {
    departmentCategoryIndex.value = index;
  }
}

DateTime parseDate(String dateStr) {
  return DateTime.parse(dateStr);
}
