import 'dart:convert';
import 'dart:developer' as logger;
import 'package:estuduff/core/platform/connection.dart';
import 'package:estuduff/core/util/converter.dart';
import 'package:estuduff/features/environment/data/model/environment_model.dart';
import 'package:estuduff/features/environment/data/model/study_place_type_model.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';

abstract class EnvironmentRemoteDataSource {
  Future<List<Environment>> getEnvironments({int profileId, int typeId});
  Future<List<StudyPlaceType>> getAllStudyPlaceTypeTypes();
}

class EnvironmentRemoteDataSourceImpl implements EnvironmentRemoteDataSource {
  @override
  Future<List<Environment>> getEnvironments({int profileId, int typeId}) async {
    try {
      String resp = await Connection.getEnv(
        "studyplace/",
        queryParameters: {
          "studyPlaceType": typeId,
          "studyProfile": profileId,
        },
      );
      var respList = json.decode(resp);

      List<Environment> envList = List<Environment>();

      for (dynamic element in respList) {
        logger.log("element: ${element}", name: "element");

        // Retrieving studyPlaceType data
        String studyplacetypeResponse = await Connection.get(
          "studyplacetype/${element['studyPlaceType']}",
        );
        logger.log("studyplacetypeResponse: $studyplacetypeResponse");
        element['studyplacetype'] = json.decode(studyplacetypeResponse);

        // Retrieving building data
        String buildingResponse = await Connection.get(
          "building/${element['building']}",
        );
        logger.log("buildingResponse: $buildingResponse");
        element['building'] = json.decode(buildingResponse);

        // Retrieving building's campus data
        String campusResponse = await Connection.get(
          "campus/${element['building']['campus']}",
        );
        logger.log("buildingResponse: $campusResponse");
        element['building']['campus'] = json.decode(campusResponse);

        // Adjusting studyProfile
        element['studyProfile'] = element['studyProfile'][0];

        envList.add(EnvironmentModel.fromJson(element));
      }

      logger.log("envList: ${envList.length}", name: "envList");
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
