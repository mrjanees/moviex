import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'cast.dart';

part 'top_billed.g.dart';

@JsonSerializable()
class TopBilled {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'cast')
  List<Cast>? cast;

  TopBilled({this.id, this.cast});

  @override
  String toString() => 'TopBilled(id: $id, cast: $cast)';

  factory TopBilled.fromJson(Map<String, dynamic> json) {
    return _$TopBilledFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopBilledToJson(this);
}
