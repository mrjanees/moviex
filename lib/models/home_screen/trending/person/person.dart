import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<PersonResult>? results;

  Person({this.page, this.results});

  @override
  String toString() => 'Person(page: $page, results: $results)';

  factory Person.fromJson(Map<String, dynamic> json) {
    return _$PersonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
