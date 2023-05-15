import 'package:json_annotation/json_annotation.dart';

part 'season.g.dart';

@JsonSerializable()
class Season {
  @JsonKey(name: 'air_date')
  String? airDate;
  @JsonKey(name: 'episode_count')
  int? episodeCount;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'season_number')
  int? seasonNumber;

  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });

  @override
  String toString() {
    return 'Season(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber)';
  }

  factory Season.fromJson(Map<String, dynamic> json) {
    return _$SeasonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}
