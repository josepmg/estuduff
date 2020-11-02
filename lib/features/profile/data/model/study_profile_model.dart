import 'package:estuduff/features/profile/domain/entity/study_profile.dart';
import 'package:flutter/foundation.dart';

class StudyProfileModel extends StudyProfile {
  StudyProfileModel({@required id, @required name})
      : super(
          id: id,
          name: name,
        );

  factory StudyProfileModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return StudyProfileModel(
      id: json['id'],
      name: json['name'],
    );
  }

  factory StudyProfileModel.fromEntity(StudyProfile student) {
    if (student == null) return null;
    return StudyProfileModel(
      id: student.id,
      name: student.name,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    return json;
  }
}
