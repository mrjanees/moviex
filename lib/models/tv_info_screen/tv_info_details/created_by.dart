import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable()
class CreatedBy {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'credit_id')
  String? creditId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'gender')
  int? gender;
  @JsonKey(name: 'profile_path')
  String? profilePath;

  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  @override
  String toString() {
    return 'CreatedBy(id: $id, creditId: $creditId, name: $name, gender: $gender, profilePath: $profilePath)';
  }

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return _$CreatedByFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}
