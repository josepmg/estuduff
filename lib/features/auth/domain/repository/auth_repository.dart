import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/features/auth/domain/entity/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUp({
    String name,
    String email,
    String password,
    int programId,
  });

  Future<Either<Failure, User>> signIn(String email, String password);

  Future<Either<Failure, User>> getUserData();

  Future<Either<Failure, bool>> signOut();

  Future<Either<Failure, int>> getToken();
}
