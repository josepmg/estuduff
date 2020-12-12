import 'package:dartz/dartz.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/environment/domain/repository/environment_repository.dart';

class GetAllStudyPlaceTypesUseCase implements GenericUseCase<void, NoParams> {
  final EnvironmentRepository repository;

  GetAllStudyPlaceTypesUseCase(this.repository);

  Future<Either<Failure, List<StudyPlaceType>>> call(NoParams noParams) async {
    return await repository.getAllStudyPlaceTypeTypes();
  }
}
