import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/actor_screen/top_rated_people/result.dart';

abstract class TopRatedPoepleRemote {
  Future<Either<DioErrorType, List<Result>?>> topRatedPeople();
}
