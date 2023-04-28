import 'package:json_annotation/json_annotation.dart';

import 'crew.dart';
import 'guest_star.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
	@JsonKey(name: 'air_date') 
	String? airDate;
	@JsonKey(name: 'episode_number') 
	int? episodeNumber;
  @JsonKey(name: 'id')
	int? id;
   @JsonKey(name: 'name')
	String? name;
   @JsonKey(name: 'overview')
	String? overview;
	@JsonKey(name: 'production_code') 
	String? productionCode;
   @JsonKey(name: 'runtime')
	int? runtime;
	@JsonKey(name: 'season_number') 
	int? seasonNumber;
	@JsonKey(name: 'show_id') 
	int? showId;
	@JsonKey(name: 'still_path') 
	String? stillPath;
	@JsonKey(name: 'vote_average') 
	double? voteAverage;
	@JsonKey(name: 'vote_count') 
	int? voteCount;
   @JsonKey(name: 'crew')
	List<Crew>? crew;
	@JsonKey(name: 'guest_stars') 
	List<GuestStar>? guestStars;

	Episode({
		this.airDate, 
		this.episodeNumber, 
		this.id, 
		this.name, 
		this.overview, 
		this.productionCode, 
		this.runtime, 
		this.seasonNumber, 
		this.showId, 
		this.stillPath, 
		this.voteAverage, 
		this.voteCount, 
		this.crew, 
		this.guestStars, 
	});

	factory Episode.fromJson(Map<String, dynamic> json) {
		return _$EpisodeFromJson(json);
	}

	Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
