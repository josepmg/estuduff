part of 'environment_bloc.dart';

abstract class EnvironmentEvent extends Equatable {
  const EnvironmentEvent();

  @override
  List<Object> get props => [];
}

class GetByTypeEvent extends EnvironmentEvent {
  final StudyPlaceType type;

  GetByTypeEvent(this.type);

  @override
  List<Object> get props => [type];
}

class GetByProfileEvent extends EnvironmentEvent {
  final StudyProfileEnum studyProfile;

  GetByProfileEvent(this.studyProfile);

  @override
  List<Object> get props => [studyProfile];
}

class GetHomeEnvironmentsEvent extends EnvironmentEvent {}

class GetAllEvent extends EnvironmentEvent {}
