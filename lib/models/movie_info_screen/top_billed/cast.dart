import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  @JsonKey(name: 'gender')
  int? gender;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'cast_id')
  int? castId;
  @JsonKey(name: 'character')
  String? character;
  @JsonKey(name: 'credit_id')
  String? creditId;
  @JsonKey(name: 'department')
  String? department;
  @JsonKey(name: 'job')
  String? job;

  Cast(
      {this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.job,
      this.department});

  @override
  String toString() {
    return 'Cast( gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId)';
  }

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
