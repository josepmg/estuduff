part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetUserLocalTokenEvent implements AuthEvent {
  @override
  List<Object> get props => null;

  @override
  bool get stringify => null;
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final int programId;

  SignUpEvent({
    @required this.email,
    @required this.password,
    @required this.name,
    @required this.programId,
  });

  @override
  List<Object> get props => [email, password, name, programId];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends AuthEvent {}
