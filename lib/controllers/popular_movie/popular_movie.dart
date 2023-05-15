import 'dart:developer';

import 'package:get/get.dart';
import 'package:mspot/models/popular_movie_screen/top_rated_tv/top_rated_tv_result.dart';

import '../../models/popular_movie_screen/movie_generate_model/result.dart';
import '../../services/tv_screen_api/top_rated/implementation.dart';
import '../../utils/dioerror_message.dart';

class PopularMovieControllers extends GetxController {
  PopularMovieControllers.internal();
  static PopularMovieControllers instance = PopularMovieControllers.internal();
  PopularMovieControllers factory() {
    return instance;
  }

  @override
  void onInit() {
    topRatedTv();
    super.onInit();
  }

  List<TopRatedTvResult> topRatedTvList = <TopRatedTvResult>[].obs;
  List<Result> generatedMovieList = <Result>[].obs;
  Future<void> topRatedTv() async {
    final response = await TopRatedTvImpl().topRatedTv();
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('Top Rated Tv is null');
      } else {
        topRatedTvList.addAll(r);
      }
    });
  }

  Future<void> generatedMovie(
      {required String orginalLanguage,
      required String initialDate,
      required String finalDate,
      required List<int> genres}) async {
    final response = await TopRatedTvImpl().generateMovieList(
        finalDate: finalDate,
        genres: genres,
        initialDate: initialDate,
        orginalLanguage: orginalLanguage);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        log('Generated Movie List');
      } else {
        generatedMovieList.clear();
        generatedMovieList.addAll(r);
        Get.back();
        Get.back();
      }
    });
  }
}
