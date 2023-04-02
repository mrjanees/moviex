import 'package:mspot/const/api_key.dart';

class TrendingUrls {
  static String all =
      "https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey";
  static String movie =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';
  static String tv =
      'https://api.themoviedb.org/3/trending/tv/day?api_key=$apiKey';
  static String person =
      'https://api.themoviedb.org/3/trending/person/day?api_key=$apiKey';
}
