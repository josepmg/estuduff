import 'dart:convert';

import 'package:estuduff/features/auth/data/model/program_model.dart';
import 'package:estuduff/features/auth/domain/entity/program.dart';
import 'package:estuduff/features/auth/domain/entity/student.dart';
import 'package:estuduff/features/profile/data/model/study_profile_model.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile.dart';
import 'package:flutter/foundation.dart';

class StudentModel extends Student {
  StudentModel(
      {@required id,
      @required name,
      @required email,
      @required program,
      @required studyProfile})
      : super(
          id: id,
          name: name,
          email: email,
          program: program,
          studyProfile: studyProfile,
        );

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return StudentModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      program: ProgramModel.fromJson(json['program']),
      studyProfile: StudyProfileModel.fromJson(json['studyProfile']),
    );
  }

  factory StudentModel.fromEntity(Student student) {
    if (student == null) return null;
    return StudentModel(
      id: student.id,
      name: student.name,
      email: student.email,
      program: student.program,
      studyProfile: student.studyProfile,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    if (email != null) json['email'] = email;
    if (program != null && program is Program)
      json['program'] = (program as ProgramModel).toJson();
    if (studyProfile != null && studyProfile is StudyProfile)
      json['studyProfile'] = (studyProfile as StudyProfileModel).toJson();
    return json;
  }
}
