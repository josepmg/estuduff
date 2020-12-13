import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/environment/domain/usecase/get_all_study_place_types_use_case.dart';

part 'study_place_types_event.dart';
part 'study_place_types_state.dart';

class StudyPlaceTypesBloc
    extends Bloc<StudyPlaceTypesEvent, StudyPlaceTypesState> {
  final GetAllStudyPlaceTypesUseCase getAllStudyPlaceTypesUseCase;

  StudyPlaceTypesBloc(this.getAllStudyPlaceTypesUseCase)
      : super(InitialStudyPlaceTypesState());

  @override
  Stream<StudyPlaceTypesState> mapEventToState(
    StudyPlaceTypesEvent event,
  ) async* {
    if (event is GetAllStudyPlaceTypeTypesEvent) {
      yield LoadingStudyPlacesTypeState();
      final result = await getAllStudyPlaceTypesUseCase(NoParams());
      yield* _getStudyPLaceTypeListOrFailure(result);
    }
  }

  Stream<StudyPlaceTypesState> _getStudyPLaceTypeListOrFailure(
      Either<Failure, List<StudyPlaceType>> result) async* {
    yield result.fold(
      (Failure failure) {
        if (failure is PlatformFailure)
          return ErrorStudyPlacesTypeState(failure.message);
        else if (failure is ServerFailure)
          return ErrorStudyPlacesTypeState(
              StringsEstudUff.server_failure_message);
        else if (failure is GenericFailure)
          return ErrorStudyPlacesTypeState(failure.message);
        else
          return ErrorStudyPlacesTypeState(
              StringsEstudUff.generic_failure_message);
      },
      (List<StudyPlaceType> list) {
        return LoadedStudyPlacesTypeState(list);
      },
    );
  }
}
