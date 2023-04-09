import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../models/movie_info_screen/movie_info/movie_info.dart';
import '../../models/movie_info_screen/top_billed/cast.dart';

abstract class MovieInfoRemote {
  Future<Either<DioErrorType, MovieInfo?>> movieinfo(int id);
  Future<Either<DioErrorType, List<Cast>?>> topBilled(int id);
}
