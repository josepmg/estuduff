import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/environment/domain/usecase/get_environment_use_case.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';

part 'environment_event.dart';
part 'environment_state.dart';

class EnvironmentBloc extends Bloc<EnvironmentEvent, EnvironmentState> {
  final GetEnvironmentuseCase getEnvironmentuseCase;
  EnvironmentBloc(this.getEnvironmentuseCase)
      : super(InitialEnvironmentState());

  @override
  Stream<EnvironmentState> mapEventToState(
    EnvironmentEvent event,
  ) async* {
    if (event is GetByTypeEvent) {
      yield LoadingEnvironmentState();
      final result = await getEnvironmentuseCase(Params(type: event.type));
      yield* _getEnvListOrFailure(result);
    } else if (event is GetByProfileEvent) {
      yield LoadingEnvironmentState();
      final result =
          await getEnvironmentuseCase(Params(studyProfile: event.studyProfile));
      yield* _getEnvListOrFailure(result);
    } else if (event is GetAllEvent) {
      yield LoadingEnvironmentState();
      final result = await getEnvironmentuseCase(Params());
      yield* _getEnvListOrFailure(result);
    }
  }

  Stream<EnvironmentState> _getEnvListOrFailure(
      Either<Failure, List<Environment>> result) async* {
    yield result.fold(
      (Failure failure) {
        if (failure is PlatformFailure)
          return ErrorEnvironmentState(failure.message);
        else if (failure is ServerFailure)
          return ErrorEnvironmentState(StringsEstudUff.server_failure_message);
        else if (failure is GenericFailure)
          return ErrorEnvironmentState(failure.message);
        else
          return ErrorEnvironmentState(StringsEstudUff.generic_failure_message);
      },
      (List<Environment> _list) {
        return LoadedEnvironmentState(_list);
      },
    );
  }
}
