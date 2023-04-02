import 'package:get/get.dart';
import 'package:mspot/core/urls/tv/tv_urls.dart';
import 'package:mspot/models/search_screen/top_rated/result.dart';
import 'package:dio/src/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/models/tv_screen/top_rated_tv/top_rated_tv.dart';
import 'package:mspot/models/tv_screen/top_rated_tv/top_rated_tv_result.dart';
import 'package:mspot/services/search_screen_api/top_rated/top_rated_remote.dart';
import 'package:mspot/services/tv_screen_api/top_rated/top_rated_remote.dart';

import '../../../core/urls/dio.dart';

class TopRatedTvImpl extends TopRatedTvRemote {
  @override
  Future<Either<DioErrorType, List<TopRatedTvResult>?>> topRatedTv() async {
    try {
      final response = await dio.get(
        TvUrls.topRatedTvurl,
      );
      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = TopRatedTv.fromJson(dataAsjson);
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
