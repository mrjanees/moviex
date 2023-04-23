import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';

@JsonSerializable()
class Network {
  @JsonKey(name: 'id')
	int? id;
	@JsonKey(name: 'logo_path') 
	String? logoPath;
  @JsonKey(name: 'name')
	String? name;
	@JsonKey(name: 'origin_country') 
	String? originCountry;

	Network({this.id, this.logoPath, this.name, this.originCountry});

	@override
	String toString() {
		return 'Network(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
	}

	factory Network.fromJson(Map<String, dynamic> json) {
		return _$NetworkFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
