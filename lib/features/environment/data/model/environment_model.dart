import 'package:estuduff/features/environment/data/model/building_model.dart';
import 'package:estuduff/features/environment/data/model/study_place_type_model.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/profile/data/model/study_profile_model.dart';

class EnvironmentModel extends Environment {
  EnvironmentModel({
    id,
    name,
    complement,
    building,
    type,
    studyProfile,
  }) : super(
          id: id,
          name: name,
          complement: complement,
          building: building,
          type: type,
          studyProfile: studyProfile,
        );

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return EnvironmentModel(
      id: json['id'],
      name: json['name'],
    );
  }

  factory EnvironmentModel.fromEntity(Environment environment) {
    if (environment == null) return null;
    return EnvironmentModel(
      id: environment.id,
      name: environment.name,
      complement: environment.complement,
      building: environment.building,
      studyProfile: environment.studyProfile,
      type: environment.type,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    if (complement != null) json['complement'] = complement;
    if (building != null)
      json['building'] = (building as BuildingModel).toJson();
    if (studyProfile != null)
      json['studyProfile'] = (studyProfile as StudyProfileModel).toJson();
    if (type != null) json['type'] = (type as StudyPlaceTypeModel).toJson();

    return json;
  }

  static List<EnvironmentModel> listFromJson(List<dynamic> json) {
    return json == null
        ? null
        : json.map((value) => EnvironmentModel.fromJson(value)).toList();
  }
}
