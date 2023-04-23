import 'package:json_annotation/json_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable()
class SpokenLanguage {
	@JsonKey(name: 'english_name') 
	String? englishName;
	@JsonKey(name: 'iso_639_1') 
	String? iso6391;
  @JsonKey(name: 'name')
	String? name;

	SpokenLanguage({this.englishName, this.iso6391, this.name});

	@override
	String toString() {
		return 'SpokenLanguage(englishName: $englishName, iso6391: $iso6391, name: $name)';
	}

	factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
		return _$SpokenLanguageFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
