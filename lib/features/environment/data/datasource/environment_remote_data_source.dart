import 'dart:convert';
import 'dart:developer' as logger;
import 'package:dio/dio.dart';
import 'package:estuduff/core/platform/connection.dart';
import 'package:estuduff/core/util/converter.dart';
import 'package:estuduff/features/environment/data/model/environment_model.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';

abstract class EnvironmentRemoteDataSource {
  Future<List<Environment>> getEnvironments({int profileId, int typeId});
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
      String response =
          await Converter.loadFromAsset('assets/mock/get_environments.json');
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
}
