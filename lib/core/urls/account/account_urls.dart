import 'package:mspot/const/api_key.dart';

class AccountUrls {
  static const String getMoviesWatchList =
      'https://api.themoviedb.org/3/account/{account_id}/watchlist/movies?api_key=$apiKey&sort_by=created_at.asc&session_id=$sessionId';
  static const String getFavoriteMovie =
      'https://api.themoviedb.org/3/account/{account_id}/favorite/movies?api_key=$apiKey&session_id=$sessionId';
}
