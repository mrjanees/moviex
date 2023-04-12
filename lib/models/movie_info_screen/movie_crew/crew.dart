import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'original_name')
  String? originalName;
  double? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'credit_id')
  String? creditId;
  @JsonKey(name: 'department')
  String? department;
  @JsonKey(name: 'job')
  String? job;

  Crew({
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  @override
  String toString() {
    return 'Crew(name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, creditId: $creditId, department: $department, job: $job)';
  }

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
