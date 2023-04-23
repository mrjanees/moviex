import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/tv_info_screen/series_cast_model/series_cast.dart';
import 'package:mspot/models/tv_info_screen/tv_info_details/tv_info_details.dart';
import 'package:mspot/services/tv_info_screen_api/tv_info_remote.dart';
import '../../const/api_key.dart';
import '../../core/urls/dio.dart';
import '../../models/movie_info_screen/trailer_video/trailer_video.dart';
import '../../models/tv_info_screen/series_cast_model/cast.dart';

class TvInfoImple extends TvInfoRemote {
  @override
  Future<Either<DioErrorType, TvInfoDetails?>> tvInfoDetails(int id) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/tv/$id?api_key=$apiKey',
      );
      if (response.statusCode == 200 && response.data != null) {
        final dataAsjson = response.data;
        TvInfoDetails tvInfodata = TvInfoDetails.fromJson(dataAsjson);
        final videoResponse = await dio
            .get('https://api.themoviedb.org/3/tv/$id/videos?api_key=$apiKey');
        final results = TrailerVideo.fromJson(videoResponse.data);
        if (results.results.isNotEmpty) {
          final data = results.results;
          for (var result in data) {
            if (result.type == 'Trailer') {
              tvInfodata.trailerkey = result.key;
            }
          }
          log('tv trailer video key is not null');
        } else {
          tvInfodata.trailerkey = null;
          log('tv trailer video IS NULL !');
        }
        return Right(tvInfodata);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }

  @override
  Future<Either<DioErrorType, List<Cast>?>> seriesCast(int id) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/tv/$id/credits?api_key=$apiKey',
      );
      if (response.statusCode == 200 && response.data != null) {
        final dataAsjson = response.data;
        final data = SeriesCast.fromJson(dataAsjson);
        return Right(data.cast);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }
}
