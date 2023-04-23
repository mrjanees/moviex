import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/models/search_screen/search_result/result.dart';
import 'package:mspot/models/search_screen/top_rated/result.dart';
import 'package:mspot/services/search_screen_api/search_movie/implementation.dart';
import 'package:mspot/services/search_screen_api/top_rated/implementation.dart';
import 'package:mspot/views/wIdgets/search_screen/toprated_search_temp.dart';

import '../../utils/dioerror_message.dart';
import '../../views/dialogs/loding_circle.dart';

class SearchControllers extends GetxController {
  List<TopRatedResult> topRatedList = <TopRatedResult>[].obs;
  List<SearchResult> searchResultList = <SearchResult>[].obs;
  var totalresult = 0.obs;
  var totalpage = 0.obs;
  var serverPage = 1.obs;
  var searchPageTitle = ''.obs;

  @override
  void onInit() {
    searchPageTitle.value = 'Top Rated';
    topRated();
    super.onInit();
  }

  Future<void> topRated() async {
    final response = await TopRatedImplemantation().topRated();
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r == null) {
        searchPageTitle.value = 'No items';
        print('Top Rated is null');
      } else {
        topRatedList.addAll(r);
      }
    });
  }

  Future<void> searchMovie(String query, int page) async {
    loadingCircle();
    searchResultList.clear();
    topRatedList.clear();
    final response = await SearchMovieImple().searchMovie(query, page);
    response.fold((l) {
      DioErrorTypeMessage.toShowErrorMessage(l);
    }, (r) {
      if (r!.isEmpty) {
        print('Search List is null');
        Navigator.of(Get.overlayContext!).pop();
      } else {
        searchResultList.addAll(r);
        Navigator.of(Get.overlayContext!).pop();
      }
    });
  }
}
