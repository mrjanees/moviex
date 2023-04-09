import 'package:mspot/const/api_key.dart';
import 'package:mspot/models/movie_info_screen/movie_info/movie_info.dart';

import 'package:dio/src/dio_error.dart';

import 'package:dartz/dartz.dart';

import '../../core/urls/dio.dart';
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
}
