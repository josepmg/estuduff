import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';

class StudyProfileModel {
  final StudyProfileEnum studyProfileEnum;
  StudyProfileModel({this.studyProfileEnum});

  // factory StudyProfileModel.fromJson(Map<String, dynamic> json) {
  //   if (json == null) return null;
  //   return StudyProfileModel(
  //     id: json['id'],
  //     name: json['name'],
  //   );
  // }

  // static StudyProfileEnum fromJson(Map<String, dynamic> json) {
  //   if (json == null) return null;
  //   switch (json['id']) {
  //     case 1:
  //       return StudyProfileEnum.LONELY_WOLF;
  //     case 2:
  //       return StudyProfileEnum.JACK_OF_ALL_TRADES;
  //     case 3:
  //       return StudyProfileEnum.OUTGOING;
  //     default:
  //       return null;
  //   }
  // }

  static StudyProfileEnum fromJson(int id) {
    if (id == null) return null;
    switch (id) {
      case 1:
        return StudyProfileEnum.LONELY_WOLF;
      case 2:
        return StudyProfileEnum.JACK_OF_ALL_TRADES;
      case 3:
        return StudyProfileEnum.OUTGOING;
      default:
        return null;
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (studyProfileEnum != null) json['id'] = studyProfileEnum.getProfileId();
    if (studyProfileEnum != null)
      json['name'] = studyProfileEnum.getProfileName();
    return json;
  }
}
