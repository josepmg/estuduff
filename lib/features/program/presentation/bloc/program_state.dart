part of 'program_bloc.dart';

abstract class ProgramState extends Equatable {
  const ProgramState();

  @override
  List<Object> get props => [];
}

class ProgramInitial extends ProgramState {}

class ProgramLoading extends ProgramState {}

class ProgramLoaded extends ProgramState {
  final List<Program> porgramList;

  ProgramLoaded(this.porgramList);

  @override
  List<Object> get props => [porgramList];
}

class ProgramError extends ProgramState {
  final String message;

  ProgramError({this.message});

  @override
  List<Object> get props => [message];
}
