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
    latitude,
    longitude,
  }) : super(
          id: id,
          name: name,
          complement: complement,
          building: building,
          type: type,
          studyProfile: studyProfile,
          latitude: latitude,
          longitude: longitude,
        );

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    print("latitude: ${json['latitude'].runtimeType}");
    return EnvironmentModel(
      id: json['id'],
      name: json['name'],
      complement: json['complement'],
      building: BuildingModel.fromJson(json['building']),
      type: StudyPlaceTypeModel.fromJson(json['type']),
      studyProfile: StudyProfileModel.fromJson(json['studyProfile']),
      latitude: (json['latitude'] is double) ? json['latitude'] : null,
      longitude: (json['longitude'] is double) ? json['longitude'] : null,
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
      latitude: environment.latitude,
      longitude: environment.longitude,
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
    if (latitude != null) json['latitude'] = "$latitude";
    if (longitude != null) json['latitude'] = "$longitude";

    return json;
  }

  static List<EnvironmentModel> listFromJson(List<dynamic> json) {
    return json == null
        ? null
        : json.map((value) => EnvironmentModel.fromJson(value)).toList();
  }
}
