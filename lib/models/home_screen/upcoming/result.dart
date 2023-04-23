import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class UpcomingResult {
	@JsonKey(name: 'backdrop_path') 
	String? backdropPath;
  @JsonKey(name: 'id')
	int? id;
	@JsonKey(name: 'poster_path') 
	String? posterPath;
	@JsonKey(name: 'release_date') 
	String? releaseDate;
  @JsonKey(name: 'title')
	String? title;


	UpcomingResult({
		this.id, 
		this.posterPath, 
		this.releaseDate, 
		this.title, 
	});


	factory UpcomingResult.fromJson(Map<String, dynamic> json) {
		return _$UpcomingResultFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UpcomingResultToJson(this);
}
