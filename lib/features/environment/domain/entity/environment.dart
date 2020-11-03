import 'package:equatable/equatable.dart';
import 'package:estuduff/features/environment/domain/entity/building.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';

class Environment extends Equatable {
  final int id;
  final String name;
  final String complement;
  final Building building;
  final StudyPlaceType type;
  final StudyProfileEnum studyProfile;

  Environment({
    this.id,
    this.name,
    this.complement,
    this.building,
    this.type,
    this.studyProfile,
  });

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.complement,
        this.building,
        this.type,
        this.studyProfile,
      ];
}
