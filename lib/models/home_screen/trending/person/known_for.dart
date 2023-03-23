import 'package:json_annotation/json_annotation.dart';

part 'known_for.g.dart';

@JsonSerializable()
class KnownFor {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'media_type')
  String? mediaType;

  KnownFor({this.id, this.originalTitle, this.posterPath, this.mediaType});

  @override
  String toString() {
    return 'KnownFor(id: $id, originalTitle: $originalTitle, posterPath: $posterPath, mediaType: $mediaType)';
  }

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return _$KnownForFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KnownForToJson(this);
}
