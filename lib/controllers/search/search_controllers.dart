import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mspot/controllers/network/network_connectivity.dart';
import 'package:mspot/models/search_screen/search_result/result.dart';
import 'package:mspot/models/search_screen/top_rated/result.dart';
import 'package:mspot/services/search_screen_api/search_movie/implementation.dart';
import 'package:mspot/services/search_screen_api/top_rated/implementation.dart';

import '../../utils/dioerror_message.dart';
import '../../views/dialogs/loding_circle.dart';

class SearchControllers extends GetxController {
  SearchControllers.internal();
  static SearchControllers instance = SearchControllers.internal();
  SearchControllers factory() {
    return instance;
  }

  List<TopRatedResult> topRatedList = <TopRatedResult>[].obs;
  List<SearchResult> searchResultList = <SearchResult>[].obs;
  var totalresult = 0.obs;
  var totalpage = 0.obs;
  var serverPage = 1.obs;
  var searchPageTitle = ''.obs;
  var dropDownvalue = 0.obs;

  @override
  void onInit() {
    searchPageTitle.value = 'Top Rated';
    if (network == 'Online') {
      topRated();
    } else {
      DioErrorTypeMessage.toShowErrorMessage(DioErrorType.unknown);
    }
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
