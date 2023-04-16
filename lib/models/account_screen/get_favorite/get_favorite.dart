import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'get_favorite.g.dart';

@JsonSerializable()
class GetFavorite {
  @JsonKey(name: 'results')
  List<Result>? results;
  GetFavorite({this.results});

  @override
  String toString() => 'GetFavorite(results: $results)';

  factory GetFavorite.fromJson(Map<String, dynamic> json) {
    return _$GetFavoriteFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetFavoriteToJson(this);
}
