import 'package:dio/dio.dart';
import 'package:mspot/const/api_key.dart';
import 'package:mspot/core/urls/movie_info/urls.dart';
import 'package:mspot/models/movie_info_screen/movie_collections/movie_collections.dart';
import 'package:mspot/models/movie_info_screen/movie_crew/crew.dart';
import 'package:mspot/models/movie_info_screen/movie_crew/movie_crew.dart';
import 'package:mspot/models/movie_info_screen/movie_info/movie_info.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/models/movie_info_screen/watch_list_request/watch_list_request.dart';
import '../../core/urls/dio.dart';
import '../../models/favorite_response/favorite_response.dart';
import '../../models/movie_info_screen/favorite_request/favorite_request.dart';
import '../../models/movie_info_screen/movie_collections/part.dart';
import '../../models/movie_info_screen/top_billed/cast.dart';
import '../../models/movie_info_screen/top_billed/top_billed.dart';
import 'movie_info_remote.dart';

class MoveInfoImple extends MovieInfoRemote {
  @override
  Future<Either<DioErrorType, MovieInfo?>> movieinfo(int id) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$id?api_key=$apiKey',
      );
      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        MovieInfo data = MovieInfo.fromJson(dataAsjson);
        final videoId = await dio.get(
            'https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey');
        data.key = videoId.data['results'][0]['key'];
        return Right(data);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, List<Cast>?>> topBilled(int id) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=$apiKey',
      );
      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = TopBilled.fromJson(dataAsjson);
        return Right(data.cast);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, List<Crew>?>> movieCrew(int id) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=$apiKey',
      );
      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = MovieCrew.fromJson(dataAsjson);
        return Right(data.crew);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, FavoriteResponse?>> addFavorite(
      FavoriteRequest value) async {
    try {
      final response = await dio.post(
        MovieInfoUrls.favorite,
        data: value.toJson(),
        options: Options(contentType: 'application/json;charset=utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final dataAsjson = response.data;
        final data = FavoriteResponse.fromJson(dataAsjson);
        return Right(data);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, FavoriteResponse?>> deleteFavorite(
      FavoriteRequest value) async {
    final deleteData = FavoriteRequest.create(
        favorite: false, mediaId: value.mediaId, mediaType: value.mediaType);
    try {
      final response = await dio.post(
        MovieInfoUrls.favorite,
        data: deleteData.toJson(),
        options: Options(contentType: 'application/json;charset=utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final dataAsjson = response.data;
        final data = FavoriteResponse.fromJson(dataAsjson);
        return Right(data);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, FavoriteResponse?>> addWatchList(
      WatchListRequest value) async {
    try {
      final response = await dio.post(
        MovieInfoUrls.watchList,
        data: value.toJson(),
        options: Options(contentType: 'application/json;charset=utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final dataAsjson = response.data;
        final data = FavoriteResponse.fromJson(dataAsjson);
        return Right(data);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      print(e);
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, FavoriteResponse?>> deleteWatchList(
      WatchListRequest value) async {
    final deleteData = WatchListRequest.create(
        watchlist: false, mediaId: value.mediaId, mediaType: value.mediaType);
    try {
      final response = await dio.post(
        MovieInfoUrls.watchList,
        data: deleteData.toJson(),
        options: Options(contentType: 'application/json;charset=utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final dataAsjson = response.data;
        final data = FavoriteResponse.fromJson(dataAsjson);
        return Right(data);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, MovieCollections?>> movieCollection(
      int collectionId) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/collection/$collectionId?api_key=$apiKey',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final dataAsjson = response.data;
        final data = MovieCollections.fromJson(dataAsjson);
        return Right(data);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      print(e);
      return Left(e.type);
    }
  }
}
