import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'official')
  bool? official;
  @JsonKey(name: 'id')
  String? id;

  Result({this.name, this.key, this.type, this.official, this.id});

  @override
  String toString() {
    return 'Result(name: $name, key: $key, type: $type, official: $official, id: $id)';
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
