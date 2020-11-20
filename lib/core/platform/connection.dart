import 'dart:developer' as logger;
import 'package:dio/dio.dart';
import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/settings.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Connection {
  static Dio _http;
  static SharedPreferences _sharedPreferences;

  static _setHttpBaseUrl() {
    _http = _http ?? GetIt.I.get<Dio>();
    _http.options.baseUrl = Settings.API_BASE_URL;
  }

  static String getToken() {
    _sharedPreferences = _sharedPreferences ?? GetIt.I.get<SharedPreferences>();
    if (_sharedPreferences.containsKey(Settings.CACHED_USER_TOKEN_KEY)) {
      logger.log(
        "UserToken: ${_sharedPreferences.get(Settings.CACHED_USER_TOKEN_KEY)}",
        name: "Connection - getToken",
      );
      return _sharedPreferences.get(Settings.CACHED_USER_TOKEN_KEY);
    }
    return null;
  }

  static Future<Response> get(String path,
      {bool withToken = false, Map<String, dynamic> queryParameters}) async {
    try {
      _setHttpBaseUrl();

      //TODO: recuperar token do Preference
      var token = withToken ? getToken() : null;

      path = (token != null) ? path + "/$token" : null;
      // _http.options.headers["authorization"] =
      //     (token != null) ? "Bearer $token" : null;

      Response response =
          await _http.get(path, queryParameters: queryParameters);
      return response;
    } on DioError catch (e, stacktrace) {
      print(stacktrace);
      throw ServerException(
        statusCode: e.response.statusCode,
        message: e.response.data is String && e.response.data != null
            ? e.response.data
            : e.response.statusMessage,
      );
    } on PlatformException catch (e, stacktrace) {
      print(stacktrace);
      throw e;
    } catch (e, stacktrace) {
      print(stacktrace);
      logger.log(
        "Error: ${e.toString()}",
        name: "Connection - GET",
      );
      throw GenericException();
    }
  }

  static Future<Response> post(String path,
      {bool withToken = false,
      data,
      Map<String, dynamic> queryParameters}) async {
    Response response;
    try {
      _setHttpBaseUrl();

      //TODO: recuperar token do Preference
      var token = withToken ? getToken() : null;

      path = (token != null) ? path + "/$token" : null;
      // _http.options.headers["authorization"] =
      //     (token != null) ? "Bearer $token" : null;

      _http.options.headers['content-Type'] = 'application/json';

      response =
          await _http.post(path, data: data, queryParameters: queryParameters);

      return response;
    } on DioError catch (e, stacktrace) {
      throw ServerException(
        statusCode: e.response.statusCode,
        message: e.response.data is String && e.response.data != null
            ? e.response.data
            : e.response.statusMessage,
      );
    } on PlatformException catch (e, stacktrace) {
      throw e;
    } catch (e, stacktrace) {
      logger.log(
        "Error: ${e.toString()}",
        name: "Connection - POST",
      );
      throw GenericException();
    }
  }

  static Future<Response> put(String path,
      {bool withToken = false,
      dynamic data,
      Map<String, dynamic> queryParameters}) async {
    try {
      _setHttpBaseUrl();

      var token = withToken ? getToken() : null;

      path = (token != null) ? path + "/$token" : null;
      // _http.options.headers["authorization"] =
      //     (token != null) ? "Bearer $token" : null;
      _http.options.headers['content-Type'] = 'application/json';

      Response response =
          await _http.put(path, data: data, queryParameters: queryParameters);

      return response;
    } on DioError catch (e, stacktrace) {
      throw ServerException(
        statusCode: e.response.statusCode,
        message: e.response.data is String && e.response.data != null
            ? e.response.data
            : e.response.statusMessage,
      );
    } on PlatformException catch (e, stacktrace) {
      throw e;
    } catch (e, stacktrace) {
      logger.log(
        "Error: ${e.toString()}",
        name: "Connection - PUT",
      );
      throw GenericException();
    }
  }
}
