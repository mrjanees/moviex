import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'trailer_video.g.dart';

@JsonSerializable()
class TrailerVideo {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'results')
  List<Result> results;

  TrailerVideo({this.id, required this.results});

  @override
  String toString() => 'TrailerVideo(id: $id, results: $results)';

  factory TrailerVideo.fromJson(Map<String, dynamic> json) {
    return _$TrailerVideoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrailerVideoToJson(this);
}
