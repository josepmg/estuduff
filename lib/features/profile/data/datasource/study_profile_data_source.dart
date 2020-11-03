import 'dart:developer' as logger;
import 'package:dio/dio.dart';
import 'package:estuduff/core/platform/connection.dart';
import 'package:estuduff/features/auth/data/model/student_model.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';

abstract class StudyProfileRemoteDatasource {
  Future<bool> setStudyProfile(StudyProfileEnum studyProfile);
}

class StudyProfileRemoteDatasourceImpl implements StudyProfileRemoteDatasource {
  @override
  Future<bool> setStudyProfile(StudyProfileEnum studyProfile) async {
    try {
      StudentModel studentModel = StudentModel.fromJson(
          (await Connection.get("/profile", withToken: true)).data);
      Response response = await Connection.put(
        '/login/${studentModel.id}/profile',
        data: {
          "name": studentModel.name,
          "programId": studentModel.program.id,
          "studyProfileId": studyProfile.getProfileId()
        },
      );
      return (response.statusCode == 200);
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "AuthRemoteDataSourceImpl - signIn",
      );
      throw e();
    }
  }
}
