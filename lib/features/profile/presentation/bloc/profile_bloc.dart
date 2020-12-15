import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/util/converter.dart';
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
      this.add(
        SetProfileEvent(
          _calculateProfile(
            firstAnswer: event.firstAnswer,
            secondAnswer: event.secondAnswer,
            thirdAnswer: event.thirdAnswer,
          ),
        ),
      );
    } else if (event is SetProfileEvent) {
      yield LoadingProfileState();
      final failureOrBool =
          await setStudyProfileUseCase(Params(event.studyProfile));
      yield failureOrBool.fold(
        (failure) {
          return ErrorProfileState(Converter.mapFailureToMessages(failure));
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

  StudyProfileEnum _calculateProfile(
      {int firstAnswer, int secondAnswer, int thirdAnswer}) {
    int sumAnswers = firstAnswer + secondAnswer + thirdAnswer;

    if (sumAnswers < 5) {
      // Outgoing
      return StudyProfileEnum.OUTGOING;
    } else if (sumAnswers >= 5 && sumAnswers <= 7) {
      // Jack of all Trades
      return StudyProfileEnum.JACK_OF_ALL_TRADES;
    } else if (sumAnswers > 7) {
      // Lonely wolf
      return StudyProfileEnum.LONELY_WOLF;
    }
  }
}
