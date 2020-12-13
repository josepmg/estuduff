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
      //TODO Change endpoint
      // Response response = await Connection.get('/register', queryParameters: {
      //   "profileId": profileId,
      //   "typeId": typeId,
      // });
      // return EnvironmentModel.listFromJson(response.data);

      // Mock
      String response;
      if (typeId != null) {
        response = await Converter.loadFromAsset(
            'assets/mock/get_environments_type_1.json');
      } else if (profileId != null) {
        response = await Converter.loadFromAsset(
            'assets/mock/get_environments_profile_$profileId.json');
      } else {
        response =
            await Converter.loadFromAsset('assets/mock/get_environments.json');
      }
      List<Environment> envList = (json.decode(response) as List)
          .map(
            (data) => EnvironmentModel.fromJson(data),
          )
          .toList();
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
      //TODO Change endpoint
      // Response response = await Connection.get('/register', queryParameters: {
      //   "profileId": profileId,
      //   "typeId": typeId,
      // });
      // return EnvironmentModel.listFromJson(response.data);

      // Mock
      String response =
          await Converter.loadFromAsset('assets/mock/study_place_types.json');
      List<StudyPlaceType> envList = (json.decode(response) as List)
          .map(
            (data) => StudyPlaceTypeModel.fromJson(data),
          )
          .toList();
      return envList;
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "EnvironmentRemoteDataSourceImpl - getAllStudyPlaceTypeTypes",
      );
      throw e();
    }
  }
}
