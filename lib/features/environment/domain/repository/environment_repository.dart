import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';

abstract class EnvironmentRepository {
  Future<Either<Failure, List<Environment>>> getEnvironments(
      {int profileId, int typeId});

  Future<Either<Failure, List<StudyPlaceType>>> getAllStudyPlaceTypeTypes();

  Future<Either<Failure, List<Environment>>> getHomeEnvironments();
}
