import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/features/profile/domain/repository/study_profile_repository.dart';

class SetStudyProfileUseCase extends GenericUseCase<void, Params> {
  final StudyProfileRepository repository;

  SetStudyProfileUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.setStudyProfile(params.studyProfileEnum);
  }
}

class Params extends Equatable {
  final StudyProfileEnum studyProfileEnum;

  Params(this.studyProfileEnum);

  List<Object> get props => [studyProfileEnum];
}
