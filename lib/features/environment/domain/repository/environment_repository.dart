import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';

abstract class EnvironmentRepository {
  Future<Either<Failure, List<Environment>>> getEnvironments(
      {int profileId, int typeId});
}
