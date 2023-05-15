import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  @JsonKey(name: 'adult')
  bool? adult;
  @JsonKey(name: 'gender')
  int? gender;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'character')
  String? character;
  @JsonKey(name: 'credit_id')
  String? creditId;
  @JsonKey(name: 'order')
  int? order;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.profilePath,
    this.character,
    this.creditId,
    this.order,
  });

  @override
  String toString() {
    return 'Cast(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, profilePath: $profilePath, character: $character, creditId: $creditId, order: $order)';
  }

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
