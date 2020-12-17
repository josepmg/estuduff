import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/error/failure.dart';

import 'package:estuduff/core/util/converter.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/environment/domain/usecase/get_environment_use_case.dart';

import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';

part 'environment_event.dart';
part 'environment_state.dart';

class EnvironmentBloc extends Bloc<EnvironmentEvent, EnvironmentState> {
  final GetEnvironmentuseCase getEnvironmentUseCase;

  EnvironmentBloc(this.getEnvironmentUseCase)
      : super(InitialEnvironmentState());

  @override
  Stream<EnvironmentState> mapEventToState(
    EnvironmentEvent event,
  ) async* {
    if (event is GetByTypeEvent) {
      yield LoadingEnvironmentState();
      final result = await getEnvironmentUseCase(Params(type: event.type));
      yield* _getEnvListOrFailure(result);
    } else if (event is GetByProfileEvent) {
      yield LoadingEnvironmentState();
      final result =
          await getEnvironmentUseCase(Params(studyProfile: event.studyProfile));
      yield* _getEnvListOrFailure(result);
    } else if (event is GetAllEvent) {
      yield LoadingEnvironmentState();
      final result = await getEnvironmentUseCase(Params());
      yield* _getEnvListOrFailure(result);
    } else if (event is GetUserProfileEnvironmentsEvent) {
      yield LoadingEnvironmentState();
      final result = await getEnvironmentUseCase(Params(withToken: true));
      yield* _getEnvListOrFailure(result);
    }
  }

  Stream<EnvironmentState> _getEnvListOrFailure(
      Either<Failure, Map<String, dynamic>> result) async* {
    yield result.fold(
      (Failure failure) {
        return ErrorEnvironmentState(Converter.mapFailureToMessages(failure));
      },
      (Map<String, dynamic> map) {
        return LoadedEnvironmentState(map['envList'], map['studyProfile']);
      },
    );
  }
}
