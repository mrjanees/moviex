import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  @JsonKey(name: 'job')
  String? job;
  @JsonKey(name: 'department')
  String? department;
  @JsonKey(name: 'credit_id')
  String? creditId;
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
  @JsonKey(name: 'original_name')
  String? originalName;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'profile_path')
  dynamic profilePath;

  Crew({
    this.job,
    this.department,
    this.creditId,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
