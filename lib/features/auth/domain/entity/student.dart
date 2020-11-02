import 'package:equatable/equatable.dart';
import 'package:estuduff/features/auth/domain/entity/program.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile.dart';

class Student extends Equatable {
  final int id;
  final String name;
  final String email;
  final Program program;
  final StudyProfile studyProfile;

  Student({this.id, this.name, this.email, this.program, this.studyProfile});

  @override
  List<Object> get props => [id, name, email, program, studyProfile];
}
