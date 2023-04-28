import 'dart:developer';

import 'package:get/get.dart';
import 'package:mspot/services/season_info_screen_api/implementation.dart';
import 'package:mspot/services/season_info_screen_api/remote.dart';

import '../../models/tv_info_screen/season_info/season_info.dart';
import '../../utils/dioerror_message.dart';

class SeasonInfoController extends GetxController {
  SeasonInfoController.internal();
  static SeasonInfoController instance = SeasonInfoController.internal();
  SeasonInfoController factory() {
    return instance;
  }

  var seasonInfoData = SeasonInfo().obs;

  Future<void> seasonInfo(int id, int season) async {
    final response = await SeasonInfoImple().seasonInfo(id, season);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
      log(l.toString());
    }, (r) {
      if (r == null) {
        log('Season data is null');
      } else {
        seasonInfoData.value = r;
        log(seasonInfoData.toString());
        Get.back();
      }
    });
    Get.toNamed('SeasonInfoScreen');
  }
}
