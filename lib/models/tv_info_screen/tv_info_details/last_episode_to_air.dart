import 'package:json_annotation/json_annotation.dart';

part 'last_episode_to_air.g.dart';

@JsonSerializable()
class LastEpisodeToAir {
  @JsonKey(name: 'id')
	int? id;
  @JsonKey(name: 'name')
	String? name;
  @JsonKey(name: 'overview')
	String? overview;
	@JsonKey(name: 'vote_average') 
	double? voteAverage;
	@JsonKey(name: 'vote_count') 
	int? voteCount;
	@JsonKey(name: 'air_date') 
	String? airDate;
	@JsonKey(name: 'episode_number') 
	int? episodeNumber;
	@JsonKey(name: 'production_code') 
	String? productionCode;
	int? runtime;
	@JsonKey(name: 'season_number') 
	int? seasonNumber;
	@JsonKey(name: 'show_id') 
	int? showId;
	@JsonKey(name: 'still_path') 
	String? stillPath;

	LastEpisodeToAir({
		this.id, 
		this.name, 
		this.overview, 
		this.voteAverage, 
		this.voteCount, 
		this.airDate, 
		this.episodeNumber, 
		this.productionCode, 
		this.runtime, 
		this.seasonNumber, 
		this.showId, 
		this.stillPath, 
	});

	@override
	String toString() {
		return 'LastEpisodeToAir(id: $id, name: $name, overview: $overview, voteAverage: $voteAverage, voteCount: $voteCount, airDate: $airDate, episodeNumber: $episodeNumber, productionCode: $productionCode, runtime: $runtime, seasonNumber: $seasonNumber, showId: $showId, stillPath: $stillPath)';
	}

	factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
		return _$LastEpisodeToAirFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}
