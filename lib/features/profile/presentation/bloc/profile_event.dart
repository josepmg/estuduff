part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class AnswerQuizEvent extends ProfileEvent{
  final int firstAnswer;
  final int secondAnswer;
  final int thirdAnswer;

  AnswerQuizEvent({this.firstAnswer, this.secondAnswer, this.thirdAnswer});

  List<Object> get props => [firstAnswer, secondAnswer, thirdAnswer];
}

class SetProfileEvent extends ProfileEvent {
  final StudyProfileEnum studyProfile;

  SetProfileEvent(this.studyProfile);

  @override
  List<Object> get props => [studyProfile];
}
