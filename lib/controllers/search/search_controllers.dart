import 'package:get/get.dart';
import 'package:mspot/models/search_screen/search_result/result.dart';
import 'package:mspot/models/search_screen/top_rated/result.dart';
import 'package:mspot/services/search_screen_api/search_movie/implementation.dart';
import 'package:mspot/services/search_screen_api/top_rated/implementation.dart';

import '../../utils/dioerror_message.dart';

class SearchControllers extends GetxController {
  List<TopRatedResult> topRatedList = <TopRatedResult>[].obs;
  List<SearchResult> searchResultList = <SearchResult>[].obs;
  var totalresult = 0.obs;
  var page = 0;
  @override
  void onInit() {
    topRated();
    super.onInit();
  }

  Future<void> topRated() async {
    final response = await TopRatedImplemantation().topRated();
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('Top Rated is null');
      } else {
        topRatedList.addAll(r);
      }
    });
  }

  Future<void> searchMovie(String query) async {
    searchResultList.clear();
    topRatedList.clear();
    final response = await SearchMovieImple().searchMovie(query);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        print('Search List is null');
      } else {
        searchResultList.addAll(r);
      }
    });
  }
}
