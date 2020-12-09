import 'dart:developer' as logger;
import 'package:dio/dio.dart';
import 'package:estuduff/core/platform/connection.dart';
import 'package:estuduff/features/program/data/model/program_model.dart';
import 'package:estuduff/features/program/domain/entity/program.dart';

abstract class ProgramRemoteDataSource {
  Future<List<Program>> getAll();
}

class ProgramRemoteDataSourceImpl implements ProgramRemoteDataSource {
  @override
  Future<List<Program>> getAll() async {
    try {
      Response response = await MockedConnection.post('/program');
      return ProgramModel.listFromJson(response.data);
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "AuthRemoteDataSourceImpl - getAll",
      );
      throw e();
    }
  }
}
