import 'package:json_annotation/json_annotation.dart';

part 'guest_star.g.dart';

@JsonSerializable()
class GuestStar {
  @JsonKey(name: 'character')
  String? character;
  @JsonKey(name: 'credit_id')
  String? creditId;
  @JsonKey(name: 'order')
  int? order;
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
  String? profilePath;

  GuestStar({
    this.character,
    this.creditId,
    this.order,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  });

  factory GuestStar.fromJson(Map<String, dynamic> json) {
    return _$GuestStarFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GuestStarToJson(this);
}
