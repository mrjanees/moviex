import 'package:mspot/const/api_key.dart';
import 'package:mspot/models/tv_info_screen/season_info/season_info.dart';
import 'package:dio/src/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/services/season_info_screen_api/remote.dart';

import '../../core/urls/dio.dart';

class SeasonInfoImple extends SeasonInfoApiRemote{
  @override
  Future<Either<DioErrorType, SeasonInfo?>> seasonInfo(int id,int season) async{
   try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/tv/$id/season/$season?api_key=$apiKey',
      );
      if (response.statusCode == 200 &&response.data != null) {
        final dataAsjson = response.data;
        final data = SeasonInfo.fromJson(dataAsjson);
        return Right(data);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      return Left(e.type);
    }
  }
}