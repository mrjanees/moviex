import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/core/colors/app_color.dart';
import 'package:mspot/models/movie_info_screen/favorite_request/favorite_request.dart';
import 'package:mspot/models/movie_info_screen/movie_collections/movie_collections.dart';
import 'package:mspot/models/movie_info_screen/movie_crew/crew.dart';
import 'package:mspot/models/movie_info_screen/watch_list_request/watch_list_request.dart';
import '../../models/movie_info_screen/movie_info/movie_info.dart';
import '../../models/movie_info_screen/top_billed/cast.dart';
import '../../services/movie_info_api/implementation.dart';
import '../../utils/dioerror_message.dart';
import '../../views/dialogs/success_snackbar.dart';
import '../../views/pages/profile_screen.dart';
import '../account/controller.dart';
import 'dart:developer';

class MovieInfoController extends GetxController {
  // Singleton
  MovieInfoController.internal();
  static MovieInfoController instance = MovieInfoController.internal();
  MovieInfoController factory() {
    return instance;
  }

  // variables
  var movieInfoData = MovieInfo().obs;
  final _favIcon = false.obs;
  bool get favIcon => _favIcon.value;
  final _watchListIcon = false.obs;
  bool get watchListIcon => _watchListIcon.value;
  List<Cast> topBilledList = <Cast>[].obs;
  List<Crew> movieCrewList = <Crew>[].obs;
  var movieCollectionName = ''.obs;
  var movieCollections = MovieCollections().obs;

  // fetching movie information
  Future<void> movieInfo(int id) async {
    print(id);
    await topBilled(id);
    final response = await MoveInfoImple().movieinfo(id);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
      log(l.toString());
    }, (r) {
      if (r == null) {
        print('movieInfo data is null');
      } else {
        movieInfoData.value = r;
        log(movieInfoData.toString());
        Get.back();
      }
    });

    if (movieInfoData.value.belongsToCollection != null) {
      movieCollection(movieInfoData.value.belongsToCollection!.id!);
    }
    Get.toNamed('/MovieInfo');
  }

  //fetching topBilled cast
  Future<void> topBilled(int id) async {
    log('top topBilled');
    await movieCrew(id);
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
          }
        }
      }
    });
  }

  // Fetching movie crew details
  Future<void> movieCrew(int id) async {
    log('movieCrew');
    movieCrewList.clear();
    final response = await MoveInfoImple().movieCrew(id);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('Movie Info is null');
      } else {
        for (var r in r) {
          if (r.job == 'Director') {
            movieCrewList.add(r);
          } else if (r.job == 'Story') {
            movieCrewList.add(r);
          } else if (r.job == 'Producer') {
            movieCrewList.add(r);
          } else if (r.job == 'Editor') {
            movieCrewList.add(r);
          } else if (r.job == 'Screenplay') {
            movieCrewList.add(r);
          } else if (r.job == 'Visual Effects') {
            movieCrewList.add(r);
          }
        }
      }
      movieCrewList.sort((a, b) {
        if (a.job == 'Director') {
          return -1; // a comes before b
        } else if (b.job == 'Director') {
          return 1; // a comes after b
        } else if (a.job == 'Producer') {
          return -1; // a comes before b
        } else if (b.job == 'Producer') {
          return 1; // a comes after b
        } else {
          return a.job!.compareTo(b.job!); // compare alphabetically
        }
      });
    });
  }

  Future<void> addFavorite(FavoriteRequest value) async {
    final data = accountController.favoriteMovieList;
    var contains = data.where((movie) => movie.id == value.mediaId);
    if (contains.isEmpty) {
      final response = await MoveInfoImple().addFavorite(value);
      response.fold((l) {
        DioErrorTypeMessage.toShowErrorMessage(l);
      }, (r) {
        if (r!.success == true) {
          successSnackbar('Added Successfully ', 'Movie added to Favorite List',
              Icons.favorite, Colors.red, WHITE_COLOR);
        }
      });
    } else {
      final response = await MoveInfoImple().deleteFavorite(value);
      response.fold((l) {
        DioErrorTypeMessage.toShowErrorMessage(l);
      }, (r) {
        if (r!.success == true) {
          successSnackbar(
              'Deleted Successfully ',
              'Movie Deleted From Favorite List',
              Icons.favorite_border,
              Colors.red,
              WHITE_COLOR);
        }
      });
    }
    Get.put(AccountController.instance.getFavoriteMovie());
  }

  bool isFavorite(int id) {
    final data = accountController.favoriteMovieList;
    var contain = data.where((element) => element.id == id);
    if (contain.isEmpty) {
      _favIcon.value = false;
    } else {
      _favIcon.value = true;
    }
    return favIcon;
  }

  bool isWatchlist(int id) {
    final data = accountController.watchMovieList;
    var contain = data.where((element) => element.id == id);
    if (contain.isEmpty) {
      _watchListIcon.value = false;
    } else {
      _watchListIcon.value = true;
    }
    return watchListIcon;
  }

  Future<void> addWatchList(WatchListRequest value) async {
    final data = accountController.watchMovieList;
    var contains = data.where((movie) => movie.id == value.mediaId);
    if (contains.isEmpty) {
      final response = await MoveInfoImple().addWatchList(value);
      response.fold((l) {
        DioErrorTypeMessage.toShowErrorMessage(l);
      }, (r) {
        if (r!.success == true) {
          successSnackbar('Added Successfully ', 'Movie added to WatchList',
              Icons.bookmark, Colors.red, WHITE_COLOR);
        }
      });
    } else {
      final response = await MoveInfoImple().deleteWatchList(value);
      response.fold((l) {
        DioErrorTypeMessage.toShowErrorMessage(l);
      }, (r) {
        if (r!.success == true) {
          successSnackbar(
              'Deleted Successfully ',
              'Movie Deleted From WatchList',
              Icons.bookmark_border,
              Colors.red,
              WHITE_COLOR);
        }
      });
    }
    Get.put(AccountController.instance.getMovieWatchList());
  }

  Future<void> movieCollection(int collectionId) async {
    final response = await MoveInfoImple().movieCollection(collectionId);
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      movieCollectionName.value =
          r!.parts!.map((collection) => collection.title).join(', ');
      movieCollections.value = r;
    });
  }
}
