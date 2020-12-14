part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignedIn extends AuthState {
  final User user;
  AuthSignedIn({this.user});

  @override
  List<Object> get props => [user];
}

class AuthNotSignedIn extends AuthState {}

class AuthUserLoaded extends AuthState {
  final User user;

  AuthUserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class AuthError extends AuthState {
  final String message;

  AuthError({this.message});

  @override
  List<Object> get props => [message];
}
