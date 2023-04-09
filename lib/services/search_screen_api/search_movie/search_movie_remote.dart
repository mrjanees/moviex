import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mspot/models/search_screen/search_result/result.dart';

abstract class SearchMovieRemote {
  Future<Either<DioErrorType, List<SearchResult>?>> searchMovie(
      String query, int page);
}
