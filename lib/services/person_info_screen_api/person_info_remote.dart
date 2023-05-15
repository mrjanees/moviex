import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/person_Info_screen/person_model/person_model.dart';
import 'package:mspot/models/person_Info_screen/person_movie_credits/cast.dart';

import '../../models/person_Info_screen/person_movie_credits/person_movie_credits.dart';

abstract class PersonInfoApiRemote {
  Future<Either<DioErrorType, PersonInfoModel?>> personInfo(int id);
  Future<Either<DioErrorType, List<Cast>?>> personMovieCredit(int id);
  Future<Either<DioErrorType, PersonMovieCredits?>> departments(int id);
}
