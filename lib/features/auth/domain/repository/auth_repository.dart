import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/features/auth/domain/entity/student.dart';

abstract class AuthRepository {
  Future<Either<Failure, Student>> signUp({
    String name,
    String email,
    String password,
    int programId,
  });

  Future<Either<Failure, Student>> signIn(String email, String password);

  Future<Either<Failure, bool>> signOut();

  Future<Either<Failure, int>> getToken();
}
