import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/domain/repository/environment_repository.dart';

class GetUserProfileEnvironmentsUseCase
    implements GenericUseCase<void, NoParams> {
  final EnvironmentRepository repository;

  GetUserProfileEnvironmentsUseCase(this.repository);

  Future<Either<Failure, List<Environment>>> call(NoParams noParams) async {
    return await repository.getEnvironments(withToken: true);
  }
}
