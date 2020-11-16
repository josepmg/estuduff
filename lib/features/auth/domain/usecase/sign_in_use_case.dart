import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/features/auth/domain/entity/user.dart';
import 'package:estuduff/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';

class SignInUseCase extends GenericUseCase<User, Params> {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.signIn(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
