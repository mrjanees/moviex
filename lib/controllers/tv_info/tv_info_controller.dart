import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/models/tv_info_screen/tv_info_details/tv_info_details.dart';
import 'package:mspot/services/tv_info_screen_api/implementation.dart';
import '../../core/colors/app_color.dart';
import '../../models/movie_info_screen/favorite_request/favorite_request.dart';
import '../../models/movie_info_screen/watch_list_request/watch_list_request.dart';
import '../../models/tv_info_screen/series_cast_model/cast.dart';
import '../../services/movie_info_api/implementation.dart';
import '../../utils/dioerror_message.dart';
import '../../views/dialogs/success_snackbar.dart';
import '../../views/pages/profile_screen.dart';
import '../account/controller.dart';

class TvInfoController extends GetxController {
  //Singleton
  TvInfoController.internal();
  static TvInfoController instance = TvInfoController.internal();
  TvInfoController factory() {
    return instance;
  }

  //varialbes
  final _favIcon = false.obs;
  bool get favIcon => _favIcon.value;
  final _watchListIcon = false.obs;
  bool get watchListIcon => _watchListIcon.value;
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

  Future<void> addWatchList(WatchListRequest value) async {
    final data = accountController.tvWatchList;
    var contains = data.where((movie) => movie.id == value.mediaId);
    if (contains.isEmpty) {
      final response = await MoveInfoImple().addWatchList(value);
      response.fold((l) {
        DioErrorTypeMessage.toShowErrorMessage(l);
      }, (r) {
        if (r!.success == true) {
          successSnackbar('Added Successfully ', 'TV added to WatchList',
              Icons.bookmark, Colors.red, WHITE_COLOR);
        }
      });
    } else {
      final response = await MoveInfoImple().deleteWatchList(value);
      response.fold((l) {
        DioErrorTypeMessage.toShowErrorMessage(l);
      }, (r) {
        if (r!.success == true) {
          successSnackbar('Deleted Successfully ', 'TV Deleted From WatchList',
              Icons.bookmark_border, Colors.red, WHITE_COLOR);
        }
      });
    }
    Get.put(AccountController.instance.getTvWatchList());
  }

  Future<void> addFavorite(FavoriteRequest value) async {
    final data = accountController.favoriteTvList;
    var contains = data.where((tv) => tv.id == value.mediaId);
    if (contains.isEmpty) {
      final response = await MoveInfoImple().addFavorite(value);
      response.fold((l) {
        DioErrorTypeMessage.toShowErrorMessage(l);
      }, (r) {
        if (r!.success == true) {
          successSnackbar('Added ', 'Tvadded to Favorite List', Icons.favorite,
              Colors.red, WHITE_COLOR);
        }
      });
    } else {
      final response = await MoveInfoImple().deleteFavorite(value);
      response.fold((l) {
        DioErrorTypeMessage.toShowErrorMessage(l);
      }, (r) {
        if (r!.success == true) {
          successSnackbar('Deleted ', 'TV Deleted From Favorite List',
              Icons.favorite_border, Colors.red, WHITE_COLOR);
        }
      });
    }
    Get.put(AccountController.instance.getFavoriteTv());
  }

  bool isFavorite(int id) {
    final data = accountController.favoriteTvList;
    var contain = data.where((element) => element.id == id);
    if (contain.isEmpty) {
      _favIcon.value = false;
    } else {
      _favIcon.value = true;
    }
    return favIcon;
  }

  bool isWatchlist(int id) {
    final data = accountController.tvWatchList;
    var contain = data.where((element) => element.id == id);
    if (contain.isEmpty) {
      _watchListIcon.value = false;
    } else {
      _watchListIcon.value = true;
    }
    return watchListIcon;
  }
}
