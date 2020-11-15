part of 'environment_bloc.dart';

abstract class EnvironmentState extends Equatable {
  const EnvironmentState();

  @override
  List<Object> get props => [];
}

class InitialEnvironmentState extends EnvironmentState {}

class LoadingEnvironmentState extends EnvironmentState {}

class LoadedEnvironmentState extends EnvironmentState {
  final List<Environment> environmentList;

  LoadedEnvironmentState(this.environmentList);

  @override
  List<Object> get props => [environmentList];
}

class ErrorEnvironmentState extends EnvironmentState {
  final String message;

  ErrorEnvironmentState(this.message);

  @override
  List<Object> get props => [message];
}
