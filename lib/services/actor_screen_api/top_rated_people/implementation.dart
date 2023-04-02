import 'package:dio/dio.dart';
import 'package:mspot/core/urls/actor/actor_urls.dart';
import 'package:mspot/models/actor_screen/top_rated_people/result.dart';
import 'package:dartz/dartz.dart';
import 'package:mspot/models/actor_screen/top_rated_people/top_rated_people.dart';
import 'package:mspot/services/actor_screen_api/top_rated_people/top_rated_people_remote.dart';

import '../../../core/urls/dio.dart';

class TopRatedPeopleImple extends TopRatedPoepleRemote {
  @override
  Future<Either<DioErrorType, List<Result>?>> topRatedPeople() async {
    try {
      final response = await dio.get(
        ActorsUrl.topRatedPeople,
      );
      if (response.statusCode == 200 || response.data != null) {
        final dataAsjson = response.data;
        final data = TopRatedPeople.fromJson(dataAsjson);
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
