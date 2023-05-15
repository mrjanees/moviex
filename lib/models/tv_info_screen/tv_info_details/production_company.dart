import 'package:json_annotation/json_annotation.dart';

part 'production_company.g.dart';

@JsonSerializable()
class ProductionCompany {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'origin_country')
  String? originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  @override
  String toString() {
    return 'ProductionCompany(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return _$ProductionCompanyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}
