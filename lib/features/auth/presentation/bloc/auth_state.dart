part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignedIn extends AuthState {
  final int token;

  AuthSignedIn({this.token});

  @override
  List<Object> get props => [token];
}

class AuthNotSignedIn extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({this.message});

  @override
  List<Object> get props => [message];
}
