import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../models/popular_movie_screen/generate/movie_generate_model.dart';
import '../../../models/popular_movie_screen/movie_generate_model/result.dart';
import '../../../models/popular_movie_screen/top_rated_tv/top_rated_tv_result.dart';

abstract class PopularMovieRemote {
  Future<Either<DioErrorType, List<TopRatedTvResult>?>> topRatedTv();
  Future<Either<DioErrorType, List<Result>?>> generateMovieList(
      {required String orginalLanguage,
      required String initialDate,
      required String finalDate,
      required List<int> genres});
}
