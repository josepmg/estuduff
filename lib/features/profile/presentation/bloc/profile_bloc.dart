import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/features/profile/domain/usecase/set_study_profile_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SetStudyProfileUseCase setStudyProfileUseCase;
  ProfileBloc(this.setStudyProfileUseCase) : super(InitialProfileState());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is AnswerQuizEvent) {
      yield LoadingProfileState();
      yield _getStudyProfileFromAnswers(
          firstAnswer: event.firstAnswer,
          secondAnswer: event.secondAnswer,
          thirdAnswer: event.thirdAnswer);
    } else if (event is SetProfileEvent) {
      yield LoadingProfileState();
      final failureOrBool =
          await setStudyProfileUseCase(Params(event.studyProfile));
      yield failureOrBool.fold(
        (failure) {
          if (failure is PlatformFailure)
            return ErrorProfileState(failure.message);
          else if (failure is ServerFailure)
            return ErrorProfileState(StringsEstudUff.server_failure_message);
          else if (failure is GenericFailure)
            return ErrorProfileState(failure.message);
          else if (failure is NoInternetConnectionFailure)
            return ErrorProfileState(
                StringsEstudUff.no_internet_failure_message);
          else
            return ErrorProfileState(StringsEstudUff.generic_failure_message);
        },
        (bool _result) {
          if (_result)
            return SettedProfileState(event.studyProfile);
          else
            return ErrorProfileState(StringsEstudUff.generic_failure_message);
        },
      );
    }
  }

  ProfileState _getStudyProfileFromAnswers(
      {int firstAnswer, int secondAnswer, int thirdAnswer}) {
    int sumAnswers = firstAnswer + secondAnswer + thirdAnswer;

    if (sumAnswers < 5) {
      // Outgoing
      return QuizAnsweredProfileState(StudyProfileEnum.OUTGOING);
    } else if (sumAnswers >= 5 && sumAnswers <= 7) {
      // Jack of all Trades
      return QuizAnsweredProfileState(StudyProfileEnum.JACK_OF_ALL_TRADES);
    } else if (sumAnswers > 7) {
      // Lonely wolf
      return QuizAnsweredProfileState(StudyProfileEnum.LONELY_WOLF);
    }
  }
}
