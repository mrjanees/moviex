import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/views/dialogs/loding_circle.dart';
import 'package:mspot/views/pages/movie_info_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/movie_info_screen/movie_info/movie_info.dart';
import '../../models/movie_info_screen/top_billed/cast.dart';
import '../../services/movie_info_api/implementation.dart';
import '../../utils/dioerror_message.dart';

class MovieInfoController extends GetxController {
  MovieInfoController.internal();
  static MovieInfoController instance = MovieInfoController.internal();
  MovieInfoController factory() {
    return instance;
  }

  var movieInfoData = MovieInfo().obs;

  List<Cast> topBilledList = <Cast>[].obs;
  List<Cast> creators = <Cast>[].obs;

  // fetching movie information
  Future<void> movieInfo(int id) async {
    loadingCircle();
    await topBilled(id);

    final response = await MoveInfoImple().movieinfo(id);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('Movie Info is null');
        Navigator.of(Get.overlayContext!).pop();
      } else {
        movieInfoData.value = r;
        Navigator.of(Get.overlayContext!).pop();
      }
    });
    print(movieInfoData.value);
  }

  //fetching topBilled cast
  Future<void> topBilled(int id) async {
    topBilledList.clear();
    final response = await MoveInfoImple().topBilled(id);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('Movie Info is null');
      } else {
        for (var r in r) {
          if (r.knownForDepartment == 'Acting') {
            topBilledList.add(r);
          } else if (r.job == 'Director' ||
              r.job == 'Producer' ||
              r.job == 'Story') {
            print('else worked');
            creators.add(r);
          }
        }
        print(creators.length);
      }
    });
  }
}
