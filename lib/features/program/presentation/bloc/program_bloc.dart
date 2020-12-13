import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/core/util/converter.dart';
import 'package:estuduff/features/program/domain/entity/program.dart';
import 'package:estuduff/features/program/domain/usecase/get_all_programs.dart';

part 'program_event.dart';
part 'program_state.dart';

class ProgramBloc extends Bloc<ProgramEvent, ProgramState> {
  final GetAllProgramsUseCase getAllUseCase;
  ProgramBloc(this.getAllUseCase) : super(ProgramInitial());

  @override
  Stream<ProgramState> mapEventToState(
    ProgramEvent event,
  ) async* {
    if (event is GetAllEvent) {
      yield ProgramLoading();
      final listOrFailure = await getAllUseCase(NoParams());
      yield listOrFailure.fold(
        (failure) {
          return ProgramError(message: Converter.mapFailureToMessages(failure));
        },
        (List<Program> list) {
          return list != null && list.isNotEmpty
              ? ProgramLoaded(list)
              : ProgramError(message: "Erro ao carregar cursos");
        },
      );
    }
  }
}
