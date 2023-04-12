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

  var favoriteMovieList = <Result>[].obs;
  var watchMovieList = <Result>[].obs;

  Future<void> getFavoriteMovie() async {
    favoriteMovieList.clear();
    final response = await AccountApiImple().getFavoritemovie();
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        print('movie trendings is null');
      } else {
        favoriteMovieList.addAll(r);
      }
    });
  }

  Future<void> getMovieWatchList() async {
    watchMovieList.clear();
    final response = await AccountApiImple().getMovieWatchList();
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        print('movie trendings is null');
      } else {
        watchMovieList.addAll(r);
      }
    });
  }
}
