import 'dart:convert';

import 'package:mspot/core/urls/home/trending_url.dart';
import 'package:mspot/models/home_screen/trending/all/result.dart';
import 'package:mspot/models/home_screen/trending/movie/result.dart';
import 'package:mspot/models/home_screen/trending/tv/result.dart';
import 'package:mspot/models/home_screen/trending/person/result.dart';
import 'package:mspot/models/home_screen/trending/tv/tv.dart';
import 'package:mspot/models/home_screen/trending/person/person.dart';
import 'package:mspot/models/home_screen/trending/movie/movie.dart';
import 'package:mspot/models/home_screen/trending/all/all.dart';
import 'package:dio/src/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/services/home_screen_api/trending/trending_remote.dart';

import '../../../core/urls/dio.dart';

class TrendingImplement extends TrendingRemote {
  @override
  Future<Either<DioErrorType, List<AllResult>?>> allTrending() async {
    try {
      final response = await dio.get(
        TrendingUrls.all,
      );

      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = All.fromJson(dataAsjson);
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
  Future<Either<DioErrorType, List<MovieResult>?>> movieTrending() async {
    try {
      final response = await dio.get(
        TrendingUrls.movie,
      );

      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = Movie.fromJson(dataAsjson);
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
  Future<Either<DioErrorType, List<PersonResult>?>> personTrending() async {
    try {
      final response = await dio.get(
        TrendingUrls.person,
      );

      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = Person.fromJson(dataAsjson);
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
  Future<Either<DioErrorType, List<TvResult>?>> tvTrending() async {
    try {
      final response = await dio.get(
        TrendingUrls.tv,
      );

      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = Tv.fromJson(dataAsjson);
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
