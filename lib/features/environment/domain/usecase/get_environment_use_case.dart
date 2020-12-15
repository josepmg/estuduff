import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/platform/generic_use_case.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/environment/domain/repository/environment_repository.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';

class GetEnvironmentuseCase extends GenericUseCase<List<Environment>, Params> {
  final EnvironmentRepository repository;

  GetEnvironmentuseCase(this.repository);

  @override
  Future<Either<Failure, List<Environment>>> call(Params params) async {
    return await repository.getEnvironments(
      profileId: params.studyProfile?.getProfileId(),
      typeId: params.type?.id,
      withToken: params.withToken,
    );
  }
}

class Params extends Equatable {
  final StudyProfileEnum studyProfile;
  final StudyPlaceType type;
  final bool withToken;

  Params({this.studyProfile, this.type, this.withToken = false});

  @override
  List<Object> get props => [this.studyProfile, this.type];
}
