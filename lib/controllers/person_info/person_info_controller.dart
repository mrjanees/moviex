import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/models/person_Info_screen/person_model/person_model.dart';
import 'package:mspot/models/person_Info_screen/person_movie_credits/cast.dart';
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
  List<Cast> personMovieCredits = <Cast>[].obs;

  Future<void> personInfo(int id) async {
    loadingCircle();
    await personMovieInfo(id);
    final response = await PersonInfoApiImple().personInfo(id);
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        print('Person Info is null');
      } else {
        personInfoData.value = r;
      }
    });
    Get.back();
  }

  Future<void> personMovieInfo(int id) async {
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
}
