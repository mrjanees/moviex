import 'package:json_annotation/json_annotation.dart';

import 'episode.dart';

part 'season_info.g.dart';

@JsonSerializable()
class SeasonInfo {
	@JsonKey(name: '_id') 
	String? id;
	@JsonKey(name: 'air_date') 
	String? airDate;
  @JsonKey(name: 'episodes')
	List<Episode>? episodes;
  @JsonKey(name: 'name')
	String? name;
  @JsonKey(name: 'overview')
	String? overview;
  @JsonKey(name: 'id')
	int? tvId;
	@JsonKey(name: 'poster_path') 
	String? posterPath;
	@JsonKey(name: 'season_number') 
	int? seasonNumber;

	SeasonInfo({
		this.id, 
		this.airDate, 
		this.episodes, 
		this.name, 
		this.overview, 
		this.tvId, 
		this.posterPath, 
		this.seasonNumber, 
	});

	factory SeasonInfo.fromJson(Map<String, dynamic> json) {
		return _$SeasonInfoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SeasonInfoToJson(this);
}
