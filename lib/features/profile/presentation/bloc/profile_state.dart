part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

class InitialProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class QuizAnsweredProfileState extends ProfileState {
  final StudyProfileEnum studyProfileEnum;

  QuizAnsweredProfileState(this.studyProfileEnum);

  @override
  List<Object> get props => [studyProfileEnum];

}

class SettedProfileState extends ProfileState {
  final StudyProfileEnum studyProfileEnum;

  SettedProfileState(this.studyProfileEnum);

  @override
  List<Object> get props => [studyProfileEnum];

}

class ErrorProfileState extends ProfileState {
  final String message;

  ErrorProfileState(this.message);

  @override
  List<Object> get props => [message];
}