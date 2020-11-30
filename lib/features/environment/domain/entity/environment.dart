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
  final double latitude;
  final double longitude;

  Environment({
    this.id,
    this.name,
    this.complement,
    this.building,
    this.type,
    this.studyProfile,
    this.longitude,
    this.latitude,
  });

  @override
  String toString() {
    return "id: $id; name: $name; complement: $complement; building name: ${building?.name}; type: ${type?.name}; studyProfile: ${studyProfile?.getProfileName()}, latitude: $latitude; longitude: $longitude";
  }

  @override
  List<Object> get props => [
        this.id,
        this.name,
        this.complement,
        this.building,
        this.type,
        this.studyProfile,
        this.latitude,
        this.longitude,
      ];
}
