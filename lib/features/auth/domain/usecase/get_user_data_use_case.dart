import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/features/auth/domain/entity/user.dart';
import 'package:estuduff/features/auth/domain/repository/auth_repository.dart';

class GetUserDataUseCase extends GenericUseCase<User, NoParams> {
  final AuthRepository repository;

  GetUserDataUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams noParams) async {
    return await repository.getUserData();
  }
}
