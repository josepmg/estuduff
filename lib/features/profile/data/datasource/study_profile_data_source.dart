import 'dart:convert';
import 'dart:developer' as logger;
import 'package:estuduff/core/platform/connection.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';

abstract class StudyProfileRemoteDatasource {
  Future<bool> setStudyProfile(StudyProfileEnum studyProfile);
}

class StudyProfileRemoteDatasourceImpl implements StudyProfileRemoteDatasource {
  @override
  Future<bool> setStudyProfile(StudyProfileEnum studyProfile) async {
    try {
      String putResponse = await Connection.patch(
        "user/",
        withToken: true,
        data: json.encode({'studyProfile': studyProfile.getProfileId()}),
      );
      var map = json.decode(putResponse);

      // Retrieving program data
      String programResp = await Connection.get(
        "program/${map['program']}",
      );

      map['program'] = json.decode(programResp);

      return map != null && map['id'] != null && map['id'] is int;
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "StudyProfileRemoteDatasourceImpl - setStudyProfile",
      );
      throw e;
    }
  }
}
