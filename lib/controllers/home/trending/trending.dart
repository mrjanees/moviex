import 'package:get/get.dart';
import 'package:mspot/models/home_screen/trending/all/result.dart';
import 'package:mspot/models/home_screen/trending/movie/result.dart';
import 'package:mspot/models/home_screen/trending/person/result.dart';
import 'package:mspot/models/home_screen/trending/tv/result.dart';
import 'package:mspot/models/home_screen/trending/tv/tv.dart';
import 'package:mspot/services/home_screen_api/trending/implementation.dart';
import 'package:mspot/services/home_screen_api/trending/trending_remote.dart';

import '../../../utils/dioerror_message.dart';

class TrendingController extends GetxController {
  List<AllResult> allList = <AllResult>[].obs;
  List<MovieResult> movieList = <MovieResult>[].obs;
  List<TvResult> tvList = <TvResult>[].obs;
  List<PersonResult> personList = <PersonResult>[].obs;

  @override
  void onInit() {
    all();
    movie();
    tv();
    person();

    super.onInit();
  }

  Future<void> all() async {
    final response = await TrendingImplement().allTrending();
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('All trendings is null');
      } else {
        allList.addAll(r);
      }
    });
  }

  Future<void> movie() async {
    final response = await TrendingImplement().movieTrending();
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        print('movie trendings is null');
      } else {
        movieList.addAll(r);
      }
    });
  }

  Future<void> tv() async {
    final response = await TrendingImplement().tvTrending();
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        print('movie trendings is null');
      } else {
        tvList.addAll(r);
      }
    });
  }

  Future<void> person() async {
    final response = await TrendingImplement().personTrending();
    response.fold((l) => DioErrorTypeMessage.toShowErrorMessage(l), (r) {
      if (r == null) {
        print('movie trendings is null');
      } else {
        personList.addAll(r);
        print(personList.length);
      }
    });
  }
}
