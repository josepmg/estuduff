import 'package:estuduff/features/program/data/model/program_model.dart';
import 'package:estuduff/features/program/domain/entity/program.dart';
import 'package:estuduff/features/auth/domain/entity/user.dart';
import 'package:estuduff/features/profile/data/model/study_profile_model.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/foundation.dart';

class UserModel extends User {
  UserModel(
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      program: ProgramModel.fromJson(json['program']),
      studyProfile: StudyProfileModel.fromJson(json['studyProfile']),
    );
  }

  factory UserModel.fromEntity(User student) {
    if (student == null) return null;
    return UserModel(
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
    if (studyProfile != null && studyProfile is StudyProfileEnum)
      json['studyProfile'] = (studyProfile as StudyProfileModel).toJson();
    return json;
  }
}
