import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';

class StudyPlaceTypeModel extends StudyPlaceType {
  StudyPlaceTypeModel({id, name}) : super(id: id, name: name);

  factory StudyPlaceTypeModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return StudyPlaceTypeModel(
      id: json['id'],
      name: json['name'],
    );
  }

  factory StudyPlaceTypeModel.fromEntity(StudyPlaceType studyPlaceType) {
    if (studyPlaceType == null) return null;
    return StudyPlaceTypeModel(
      id: studyPlaceType.id,
      name: studyPlaceType.name,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    return json;
  }
}
