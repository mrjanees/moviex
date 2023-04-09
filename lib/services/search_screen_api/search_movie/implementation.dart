import 'package:dio/dio.dart';
import 'package:mspot/core/urls/search/Urls.dart';
import 'package:mspot/models/search_screen/search_result/result.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/models/search_screen/search_result/search_result.dart';
import 'package:mspot/services/search_screen_api/search_movie/search_movie_remote.dart';
import 'package:mspot/views/wIdgets/search_screen/toprated_search_temp.dart';

import '../../../core/urls/dio.dart';

class SearchMovieImple extends SearchMovieRemote {
  @override
  Future<Either<DioErrorType, List<SearchResult>?>> searchMovie(
      String query, int page) async {
    try {
      final response = await dio.get(SearchUrls.searchMovie,
          queryParameters: {'query': query, 'page': page});
      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = Search.fromJson(dataAsjson);

        final result = data.results;
        searchControllers.totalpage.value = data.totalPages!;
        searchControllers.searchPageTitle.value =
            'Results - ${data.totalResults}';
        return Right(result!);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }
}
