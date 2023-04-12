import 'package:mspot/const/api_key.dart';

class MovieInfoUrls {
  static const String favorite =
      'https://api.themoviedb.org/3/account/{}/favorite?api_key=$apiKey&session_id=$sessionId';
  static const String watchList =
      'https://api.themoviedb.org/3/account/{}/watchlist?api_key=$apiKey&session_id=$sessionId';
}
