import 'dart:developer';

import 'package:get/get.dart';
import 'package:mspot/models/account_screen/get_favorite/result.dart';
import 'package:mspot/services/account_screen_api/implementation.dart';

import '../../utils/dioerror_message.dart';

class AccountController extends GetxController {
  AccountController.internal();
  static AccountController instance = AccountController.internal();
  AccountController factory() {
    return instance;
  }

  @override
  void onInit() {
    super.onInit();
    getFavoriteMovie();
    getFavoriteTv();
    getMovieWatchList();
    getTvWatchList();
  }

  var favoriteMovieList = <Result>[].obs;
  var movieWatchList = <Result>[].obs;
  var favoriteTvList = <Result>[].obs;
  var tvWatchList = <Result>[].obs;

  Future<void> getFavoriteMovie() async {
    favoriteMovieList.clear();
    final response = await AccountApiImple().getFavoritemovie();
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        log('favorite movie is null');
      } else {
        favoriteMovieList.addAll(r.reversed);
      }
    });
  }

  Future<void> getMovieWatchList() async {
    movieWatchList.clear();
    final response = await AccountApiImple().getMovieWatchList();
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        log(' moive Watch List is null');
      } else {
        movieWatchList.addAll(r.reversed);
      }
    });
  }

  Future<void> getFavoriteTv() async {
    favoriteTvList.clear();
    final response = await AccountApiImple().getFavoriteTv();
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        log('favorite tv is null');
      } else {
        favoriteTvList.addAll(r.reversed);
      }
    });
  }

  Future<void> getTvWatchList() async {
    tvWatchList.clear();
    final response = await AccountApiImple().getTvWatchList();
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        log(' tv Watch List is null');
      } else {
        tvWatchList.addAll(r.reversed);
      }
    });
  }
}
