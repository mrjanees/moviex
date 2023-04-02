import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:mspot/models/home_screen/trending/all/result.dart';
import 'package:mspot/models/home_screen/trending/movie/result.dart';

import 'package:mspot/models/home_screen/trending/person/result.dart';
import 'package:mspot/models/home_screen/trending/tv/result.dart';

abstract class TrendingRemote {
  Future<Either<DioErrorType, List<AllResult>?>> allTrending();
  Future<Either<DioErrorType, List<MovieResult>?>> movieTrending();
  Future<Either<DioErrorType, List<TvResult>?>> tvTrending();
  Future<Either<DioErrorType, List<PersonResult>?>> personTrending();
}
