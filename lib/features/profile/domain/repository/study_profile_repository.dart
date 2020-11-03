import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';

abstract class StudyProfileRepository {
  Future<Either<Failure, bool>> setStudyProfile(StudyProfileEnum studyProfile);
}
