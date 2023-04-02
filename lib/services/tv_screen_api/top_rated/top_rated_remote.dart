import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/tv_screen/top_rated_tv/top_rated_tv_result.dart';

abstract class TopRatedTvRemote {
  Future<Either<DioErrorType, List<TopRatedTvResult>?>> topRatedTv();
}
