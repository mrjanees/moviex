import '../../../const/api_key.dart';

class SearchUrls {
  static const topRated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1';
  static const searchMovie =
      'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&include_adult=false';
}
