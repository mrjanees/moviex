import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../models/tv_info_screen/season_info/season_info.dart';

abstract class SeasonInfoApiRemote {
  Future<Either<DioErrorType, SeasonInfo?>> seasonInfo(int id, int season);
}
