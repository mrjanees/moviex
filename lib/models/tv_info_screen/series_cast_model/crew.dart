import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  
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
	@JsonKey(name: 'credit_id') 
	String? creditId;
  @JsonKey(name: 'department')
	String? department;
  @JsonKey(name: 'job')
	String? job;

	Crew({
		this.adult, 
		this.gender, 
		this.id, 
		this.knownForDepartment, 
		this.name, 
		this.originalName, 
		this.popularity, 
		this.profilePath, 
		this.creditId, 
		this.department, 
		this.job, 
	});

	@override
	String toString() {
		return 'Crew(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, creditId: $creditId, department: $department, job: $job)';
	}

	factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

	Map<String, dynamic> toJson() => _$CrewToJson(this);
}
