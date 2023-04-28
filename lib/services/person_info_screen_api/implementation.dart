import 'package:dio/dio.dart';
import 'package:mspot/const/api_key.dart';
import 'package:mspot/models/person_Info_screen/person_model/person_model.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/models/person_Info_screen/person_movie_credits/cast.dart';
import 'package:mspot/models/person_Info_screen/person_movie_credits/person_movie_credits.dart';
import 'package:mspot/services/person_info_screen_api/person_info_remote.dart';
import '../../core/urls/dio.dart';

class PersonInfoApiImple extends PersonInfoApiRemote {
  @override
  Future<Either<DioErrorType, PersonInfoModel?>> personInfo(int id) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/person/$id?api_key=$apiKey',
      );
      if (response.statusCode == 200 && response.data != null) {
        final dataAsjson = response.data;
        final data = PersonInfoModel.fromJson(dataAsjson);
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
  Future<Either<DioErrorType, List<Cast>?>> personMovieCredit(int id) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/person/$id/movie_credits?api_key=$apiKey',
      );
      if (response.statusCode == 200 && response.data != null) {
        final dataAsjson = response.data;
        final data = PersonMovieCredits.fromJson(dataAsjson);
        return Right(data.cast);
      } else {
        return const Right(null);
      }
    } on DioError catch (e) {
      print(e);
      return Left(e.type);
    }
  }
  
  @override
  Future<Either<DioErrorType, PersonMovieCredits?>> departments(int id) async{
     try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/person/$id/movie_credits?api_key=$apiKey',
      );
      if (response.statusCode == 200 && response.data != null) {
        final dataAsjson = response.data;
        final data = PersonMovieCredits.fromJson(dataAsjson);
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
