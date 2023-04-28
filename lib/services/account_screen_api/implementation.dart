import 'package:mspot/core/urls/account/account_urls.dart';
import 'package:mspot/models/account_screen/get_favorite/get_favorite.dart';
import 'package:mspot/models/account_screen/get_favorite/result.dart';
import 'package:dio/src/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/services/account_screen_api/remote.dart';

import '../../core/urls/dio.dart';

class AccountApiImple extends AccountApiRemote {
  @override
  Future<Either<DioErrorType, List<Result>?>> getFavoritemovie() async {
    try {
      final response = await dio.get(
        AccountUrls.getFavoriteMovie,
      );

      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = GetFavorite.fromJson(dataAsjson);
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
  Future<Either<DioErrorType, List<Result>?>> getMovieWatchList() async {
    try {
      final response = await dio.get(
        AccountUrls.getMoviesWatchList,
      );
      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = GetFavorite.fromJson(dataAsjson);
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
  Future<Either<DioErrorType, List<Result>?>> getFavoriteTv() async{
    try {
      final response = await dio.get(
        AccountUrls.getFavoriteTv,
      );

      if (response.statusCode == 200 && response.data != null) {
        final dataAsjson = response.data;
        final data = GetFavorite.fromJson(dataAsjson);
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
  Future<Either<DioErrorType, List<Result>?>> getTvWatchList()async {
   try {
      final response = await dio.get(
        AccountUrls.getTvWatchList,
      );
      if (response.statusCode == 200 && response.data != null) {
        final dataAsjson = response.data;
        final data = GetFavorite.fromJson(dataAsjson);
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
