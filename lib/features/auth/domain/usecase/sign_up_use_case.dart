import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/features/auth/domain/model/student.dart';
import 'package:estuduff/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';

class SignUpseCase implements GenericUseCase<Student, Params> {
  final AuthRepository repository;

  SignUpseCase(this.repository);

  Future<Either<Failure, Student>> call(Params params) async {
    return await repository.signUp(
      email: params.email,
      password: params.password,
      name: params.name,
      programId: params.programId,
      studyProfileId: params.studyProfileId,
    );
  }
}

class Params extends Equatable {
  final String password;
  final String name;
  final String email;
  final int programId;
  final int studyProfileId;

  Params({
    @required this.email,
    @required this.password,
    this.name,
    this.programId,
    this.studyProfileId,
  });

  @override
  List<Object> get props => [email, password, name, programId, studyProfileId];
}
