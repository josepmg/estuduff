import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/features/auth/domain/repository/auth_repository.dart';

class GetTokenUseCase implements GenericUseCase<void, NoParams> {
  final AuthRepository repository;

  GetTokenUseCase(this.repository);

  Future<Either<Failure, int>> call(NoParams noParams) async {
    return await repository.getToken();
  }
}
