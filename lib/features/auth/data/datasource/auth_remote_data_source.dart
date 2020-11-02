import 'dart:developer' as logger;
import 'package:dio/dio.dart';
import 'package:estuduff/core/platform/connection.dart';
import 'package:estuduff/features/auth/data/model/student_model.dart';
import 'package:estuduff/features/auth/domain/entity/student.dart';

abstract class AuthRemoteDataSource {
  Future<Student> signIn(String email, String password);

  Future<Student> signUp({
    String name,
    String email,
    String password,
    int programId,
    int studyProfileId,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Student> signIn(String email, String password) async {
    try {
      Response response = await Connection.post('/login',
          data: {"email": email, "password": password});
      return StudentModel.fromJson(response.data);
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "AuthRemoteDataSourceImpl - signIn",
      );
      throw e();
    }
  }

  @override
  Future<Student> signUp(
      {String name,
      String email,
      String password,
      int programId,
      int studyProfileId}) async {
    try {
      Response response = await Connection.post('/register', data: {
        "name": name,
        "email": email,
        "password": password,
        "programId": programId,
        "studyProfileId": studyProfileId,
      });
      return StudentModel.fromJson(response.data);
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "AuthRemoteDataSourceImpl - signUp",
      );
      throw e();
    }
  }
}
