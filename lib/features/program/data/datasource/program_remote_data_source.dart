import 'dart:convert';
import 'dart:developer' as logger;
import 'package:estuduff/core/error/exception.dart';
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
      String response = await Connection.get('program/');
      var map = json.decode(response);
      print("$map");
      if (map['results'] != null)
        return ProgramModel.listFromJson(map['results']);
      else
        throw GenericException();
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "AuthRemoteDataSourceImpl - getAll",
      );
      throw e();
    }
  }
}
