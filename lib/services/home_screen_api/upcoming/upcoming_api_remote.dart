import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/home_screen/upcoming/result.dart';

abstract class UpcomingApiRemote {
  Future<Either<DioErrorType,List< UpcomingResult>?>> upcoming();
}
