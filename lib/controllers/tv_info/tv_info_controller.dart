import 'dart:developer';
import 'package:get/get.dart';
import 'package:mspot/models/tv_info_screen/tv_info_details/tv_info_details.dart';
import 'package:mspot/services/tv_info_screen_api/implementation.dart';
import '../../models/tv_info_screen/series_cast_model/cast.dart';
import '../../utils/dioerror_message.dart';

class TvInfoController extends GetxController {
  //Singleton
  TvInfoController.internal();
  static TvInfoController instance = TvInfoController.internal();
  TvInfoController factory() {
    return instance;
  }

  //varialbes
  var tvInfoData = TvInfoDetails().obs;
  List<Cast> seriesCastList = <Cast>[].obs;

  //Control tvInfo data
  Future<void> tvInfo(int id) async {
    await seriesCast(id);
    final response = await TvInfoImple().tvInfoDetails(id);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
      log(l.toString());
    }, (r) {
      if (r == null) {
        log('movieInfo data is null in TvInfoController');
      } else {
        tvInfoData.value = r;
        Get.back();
      }
    });

    Get.toNamed('/TvInfoScreen');
  }

  Future<void> seriesCast(int id) async {
    // await movieCrew(id);
    seriesCastList.clear();
    final response = await TvInfoImple().seriesCast(id);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('Movie Info is null');
      } else {
        for (var r in r) {
          if (r.knownForDepartment == 'Acting') {
            seriesCastList.add(r);
          }
        }
      }
    });
  }
}
