import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/movie_info_screen/favorite_request/favorite_request.dart';
import 'package:mspot/models/movie_info_screen/movie_collections/movie_collections.dart';

import 'package:mspot/models/movie_info_screen/movie_crew/crew.dart';
import 'package:mspot/models/movie_info_screen/watch_list_request/watch_list_request.dart';

import '../../models/favorite_response/favorite_response.dart';
import '../../models/movie_info_screen/movie_collections/part.dart';
import '../../models/movie_info_screen/movie_info/movie_info.dart';
import '../../models/movie_info_screen/top_billed/cast.dart';

abstract class MovieInfoRemote {
  Future<Either<DioErrorType, MovieInfo?>> movieinfo(int id);
  Future<Either<DioErrorType, List<Cast>?>> topBilled(int id);
  Future<Either<DioErrorType, List<Crew>?>> movieCrew(int id);
  Future<Either<DioErrorType, FavoriteResponse?>> addFavorite(
      FavoriteRequest value);
  Future<Either<DioErrorType, FavoriteResponse?>> deleteFavorite(
      FavoriteRequest value);
  Future<Either<DioErrorType, FavoriteResponse?>> addWatchList(
      WatchListRequest value);
  Future<Either<DioErrorType, FavoriteResponse?>> deleteWatchList(
      WatchListRequest value);
  Future<Either<DioErrorType, MovieCollections?>> movieCollection(
      int collectionId);
}
