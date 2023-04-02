import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/search_screen/top_rated/result.dart';

abstract class TopRatedRemote {
  Future<Either<DioErrorType, List<TopRatedResult>?>> topRated();
}
