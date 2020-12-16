import 'dart:convert';
import 'dart:developer' as logger;
import 'package:estuduff/core/platform/connection.dart';
import 'package:estuduff/core/util/converter.dart';
import 'package:estuduff/features/environment/data/model/environment_model.dart';
import 'package:estuduff/features/environment/data/model/study_place_type_model.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';

abstract class EnvironmentRemoteDataSource {
  Future<List<Environment>> getEnvironments(
      {int profileId, int typeId, bool withToken});
  Future<List<StudyPlaceType>> getAllStudyPlaceTypeTypes();
}

class EnvironmentRemoteDataSourceImpl implements EnvironmentRemoteDataSource {
  @override
  Future<List<Environment>> getEnvironments(
      {int profileId, int typeId, bool withToken}) async {
    try {
      String resp;
      if (withToken) {
        String userData = await Connection.get("user/", withToken: withToken);
        var map = json.decode(userData);

        resp = await Connection.getEnv(
          "studyplace/",
          queryParameters: {
            "studyProfile": map['studyProfile'],
          },
        );
      } else {
        resp = await Connection.getEnv(
          "studyplace/",
          queryParameters: {
            "studyPlaceType": typeId,
            "studyProfile": profileId,
          },
        );
      }
      var respList = json.decode(resp);

      List<Environment> envList = List<Environment>();

      for (dynamic element in respList) {
        // Retrieving studyPlaceType data
        String studyplacetypeResponse = await Connection.get(
          "studyplacetype/${element['studyPlaceType']}",
        );

        element['studyPlaceType'] = json.decode(studyplacetypeResponse);

        // Retrieving building data
        String buildingResponse = await Connection.get(
          "building/${element['building']}",
        );

        element['building'] = json.decode(buildingResponse);

        // Retrieving building's campus data
        String campusResponse = await Connection.get(
          "campus/${element['building']['campus']}",
        );
        element['building']['campus'] = json.decode(campusResponse);

        // Adjusting studyProfile
        element['studyProfile'] = element['studyProfile'][0];

        var env = EnvironmentModel.fromJson(element);

        envList.add(env);
      }

      return envList;
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "EnvironmentRemoteDataSourceImpl - getEnvironments",
      );
      throw e();
    }
  }

  @override
  Future<List<StudyPlaceType>> getAllStudyPlaceTypeTypes() async {
    try {
      String resp = await Connection.get("studyplacetype/");
      var respList = json.decode(resp);

      return StudyPlaceTypeModel.listFromJson(respList['results']);
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "EnvironmentRemoteDataSourceImpl - getAllStudyPlaceTypeTypes",
      );
      throw e();
    }
  }
}
