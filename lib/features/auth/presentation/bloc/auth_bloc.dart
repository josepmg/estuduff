import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/core/resource/estuduff_strings.dart';
import 'package:estuduff/core/util/converter.dart';
import 'package:estuduff/features/auth/domain/entity/student.dart';
import 'package:estuduff/features/auth/domain/usecase/get_token_use_case.dart'
    as getToken;
import 'package:estuduff/features/auth/domain/usecase/sign_in_use_case.dart'
    as signIn;
import 'package:estuduff/features/auth/domain/usecase/sign_out_use_case.dart'
    as signOut;
import 'package:estuduff/features/auth/domain/usecase/sign_up_use_case.dart'
    as signUp;
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final getToken.GetTokenUseCase getTokenUseCase;
  final signUp.SignUpseCase signUpseCase;
  final signIn.SignInUseCase signInUseCase;
  final signOut.SignOutUseCase signOutUseCase;
  AuthBloc(
      {this.getTokenUseCase,
      this.signInUseCase,
      this.signOutUseCase,
      this.signUpseCase})
      : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is GetUserLocalTokenEvent) {
      yield AuthLoading();
      final intOrFailure = await getTokenUseCase(NoParams());
      yield intOrFailure.fold(
        (failure) =>
            AuthError(message: Converter.mapFailureToMessages(failure)),
        (int token) =>
            token != null ? AuthSignedIn(token: token) : AuthNotSignedIn(),
      );
    } else if (event is SignUpEvent) {
      yield AuthLoading();
      final studentOrFailure = await signUpseCase(signUp.Params(
        email: event.email,
        password: event.password,
        name: event.name,
        programId: event.programId,
      ));
      yield* _eitherSignedInOrErrorWithInt(studentOrFailure);
    } else if (event is SignInEvent) {
      yield AuthLoading();
      final studentOrFailure = await signInUseCase(
          signIn.Params(email: event.email, password: event.password));
      yield* _eitherSignedInOrErrorWithInt(studentOrFailure);
    } else if (event is SignOutEvent) {
      yield AuthLoading();
      final boolOrFailure = await signOutUseCase(NoParams());
      yield boolOrFailure.fold(
        (failure) =>
            AuthError(message: Converter.mapFailureToMessages(failure)),
        (bool didLogout) => didLogout != null && didLogout
            ? AuthNotSignedIn()
            : AuthError(message: EstuduffStrings.cache_failure_message),
      );
    }
  }

  Stream<AuthState> _eitherSignedInOrErrorWithInt(
      Either<Failure, Student> studentOrFailure) async* {
    yield studentOrFailure.fold(
      (failure) => AuthError(message: Converter.mapFailureToMessages(failure)),
      (Student student) => student != null && student.isValid
          ? AuthSignedIn(token: student.id)
          : AuthNotSignedIn(),
    );
  }
}