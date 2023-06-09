import 'package:json_annotation/json_annotation.dart';

import 'known_for.dart';

part 'result.g.dart';

@JsonSerializable()
class PersonResult {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  @JsonKey(name: 'profile_path')
  String? profilePath;
  @JsonKey(name: 'known_for')
  List<KnownFor>? knownFor;

  PersonResult({
    this.id,
    this.name,
    this.knownForDepartment,
    this.profilePath,
    this.knownFor,
  });

  @override
  String toString() {
    return 'Result(id: $id, name: $name, knownForDepartment: $knownForDepartment, profilePath: $profilePath, knownFor: $knownFor)';
  }

  factory PersonResult.fromJson(Map<String, dynamic> json) {
    return _$PersonResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonResultToJson(this);
}
