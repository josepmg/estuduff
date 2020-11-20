import 'dart:developer' as logger;
import 'package:dio/dio.dart';
import 'package:estuduff/core/platform/connection.dart';
import 'package:estuduff/features/environment/data/model/environment_model.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';

abstract class EnvironmentRemoteDataSource {
  Future<List<Environment>> getEnvironments({int profileId, int typeId});
}

class EnvironmentRemoteDataSourceImpl implements EnvironmentRemoteDataSource {
  @override
  Future<List<Environment>> getEnvironments({int profileId, int typeId}) async {
    try {
      Response response = await Connection.get('/register', queryParameters: {
        "profileId": profileId,
        "typeId": typeId,
      });
      return EnvironmentModel.listFromJson(response.data);
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "AuthRemoteDataSourceImpl - signUp",
      );
      throw e();
    }
  }
}
