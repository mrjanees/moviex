import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/tv_info_screen/series_cast_model/cast.dart';
import '../../models/tv_info_screen/tv_info_details/tv_info_details.dart';

abstract class TvInfoRemote {
  Future<Either<DioErrorType, TvInfoDetails?>> tvInfoDetails(int id);
  Future<Either<DioErrorType, List<Cast>?>> seriesCast(int id);
}
