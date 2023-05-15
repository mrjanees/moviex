import 'package:mspot/core/urls/home/home_urls.dart';
import 'package:mspot/models/home_screen/upcoming/result.dart';
import 'package:dio/src/dio_error.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/services/home_screen_api/upcoming/upcoming_api_remote.dart';

import '../../../core/urls/dio.dart';
import '../../../models/home_screen/upcoming/upcoming.dart';

class UpcomingMovieImple extends UpcomingApiRemote {
  @override
  Future<Either<DioErrorType, List<UpcomingResult>?>> upcoming() async {
    try {
      final response = await dio.get(
        UpcomingUrl.upcoming,
      );
      if (response.statusCode == 200 && response.data != null) {
        final dataAsjson = response.data;
        final data = Upcoming.fromJson(dataAsjson);
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
