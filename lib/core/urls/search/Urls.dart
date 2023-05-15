import '../../../const/api_key.dart';

class SearchUrls {
  static const topRated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1';
  static List<String> search = [
    'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&',
    'https://api.themoviedb.org/3/search/tv?api_key=$apiKey&',
    'https://api.themoviedb.org/3/search/person?api_key=$apiKey&',
  ];
}
