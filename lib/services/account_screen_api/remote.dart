import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/account_screen/get_favorite/result.dart';

abstract class AccountApiRemote {
  Future<Either<DioErrorType, List<Result>?>> getFavoritemovie();
  Future<Either<DioErrorType, List<Result>?>> getMovieWatchList();
  Future<Either<DioErrorType, List<Result>?>> getFavoriteTv();
  Future<Either<DioErrorType, List<Result>?>> getTvWatchList();
}
