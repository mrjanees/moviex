import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'known_for.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'known_for')
  List<KnownFor>? knownFor;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'profile_path')
  String? profilePath;

  Result({
    this.id,
    this.knownFor,
    this.name,
    this.popularity,
    this.profilePath,
  });

  @override
  String toString() {
    return 'Result(id: $id, knownFor: $knownFor, name: $name, popularity: $popularity, profilePath: $profilePath)';
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
