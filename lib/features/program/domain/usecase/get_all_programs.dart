import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/features/program/domain/entity/program.dart';
import 'package:estuduff/features/program/domain/repository/program_repository.dart';

class GetAllProgramsUseCase implements GenericUseCase<void, NoParams> {
  final ProgramRepository repository;

  GetAllProgramsUseCase(this.repository);

  Future<Either<Failure, List<Program>>> call(NoParams noParams) async {
    return await repository.getAll();
  }
}
