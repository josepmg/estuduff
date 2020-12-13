import 'dart:developer' as logger;
import 'package:dio/dio.dart';
import 'package:estuduff/core/platform/connection.dart';
import 'package:estuduff/features/auth/data/model/user_model.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';

abstract class StudyProfileRemoteDatasource {
  Future<bool> setStudyProfile(StudyProfileEnum studyProfile);
}

class StudyProfileRemoteDatasourceImpl implements StudyProfileRemoteDatasource {
  @override
  Future<bool> setStudyProfile(StudyProfileEnum studyProfile) async {
    try {
      UserModel studentModel = UserModel.fromJson(
          (await MockedConnection.get("/user", queryParameters: {"id": 2}))
              .data);
      Response response = await MockedConnection.patch(
        '/user/${studentModel.id}',
        data: {"studyProfile": studyProfile.getProfileId()},
      );
      // return true;
      // TODO alterar após integração com back
      return (response.statusCode == 200);
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "StudyProfileRemoteDatasourceImpl - setStudyProfile",
      );
      throw e;
    }
  }
}
