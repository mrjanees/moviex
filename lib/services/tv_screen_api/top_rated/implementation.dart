import 'package:dio/dio.dart';
import 'package:mspot/const/api_key.dart';
import 'package:mspot/core/urls/tv/tv_urls.dart';
import 'package:dartz/dartz.dart';

import 'package:mspot/models/popular_movie_screen/movie_generate_model/movie_generate_model.dart';

import 'package:mspot/services/tv_screen_api/top_rated/top_rated_remote.dart';

import '../../../core/urls/dio.dart';
import '../../../models/popular_movie_screen/movie_generate_model/result.dart';
import '../../../models/popular_movie_screen/top_rated_tv/top_rated_tv.dart';
import '../../../models/popular_movie_screen/top_rated_tv/top_rated_tv_result.dart';

class TopRatedTvImpl extends PopularMovieRemote{
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

  @override
  Future<Either<DioErrorType, List<Result>?>> generateMovieList({required String orginalLanguage, required String initialDate, required String finalDate, required List<int> genres})async {
      try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_original_language=$orginalLanguage&release_date.gte=$initialDate&release_date.lte=$finalDate&with_genres=$genres'
      );
      if (response.statusCode == 200 && response.data != null) {
        final dataAsjson = response.data;
        final data = MovieGenerateModel.fromJson(dataAsjson);
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
