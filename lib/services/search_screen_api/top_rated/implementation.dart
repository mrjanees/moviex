import 'package:mspot/core/urls/search/Urls.dart';
import 'package:mspot/models/search_screen/top_rated/result.dart';
import 'package:dio/src/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/models/search_screen/top_rated/top_rated.dart';
import 'package:mspot/services/search_screen_api/top_rated/top_rated_remote.dart';
import 'package:mspot/views/wIdgets/actors_screen/top_rated_actors.dart';

import '../../../core/urls/dio.dart';
import '../../../core/urls/home/trending_url.dart';

class TopRatedImplemantation extends TopRatedRemote {
  @override
  Future<Either<DioErrorType, List<TopRatedResult>?>> topRated() async {
    try {
      final response = await dio.get(
        SearchUrls.topRated,
      );
      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = TopRated.fromJson(dataAsjson);
        final result = data.results;
        return Right(result);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }
}
