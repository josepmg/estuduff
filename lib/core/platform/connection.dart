import 'dart:convert';
import 'dart:developer' as logger;
import 'package:dio/dio.dart';
import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/settings.dart';
import 'package:estuduff/core/util/converter.dart';
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
      return _sharedPreferences.get(Settings.CACHED_USER_TOKEN_KEY).toString();
    }
    return null;
  }

  static Future<Response> get(
    String path, {
    bool withToken = false,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      _setHttpBaseUrl();

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

  static Future<Response> post(
    String path, {
    bool withToken = false,
    dynamic data,
    Map<String, dynamic> queryParameters,
  }) async {
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

  static Future<Response> put(
    String path, {
    bool withToken = false,
    dynamic data,
    Map<String, dynamic> queryParameters,
  }) async {
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

  static Future<Response> patch(
    String path, {
    bool withToken = false,
    dynamic data,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      _setHttpBaseUrl();

      var token = withToken ? getToken() : null;

      path = (token != null) ? path + "/$token" : null;
      // _http.options.headers["authorization"] =
      //     (token != null) ? "Bearer $token" : null;
      _http.options.headers['content-Type'] = 'application/json';

      Response response =
          await _http.patch(path, data: data, queryParameters: queryParameters);

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
        name: "Connection - PATCH",
      );
      throw GenericException();
    }
  }
}

class MockedConnection {
  static Future<Response> get(
    String path, {
    bool withToken = false,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      switch (path) {
        case "/studyplace":
          if (queryParameters != null &&
              queryParameters['profile'] != null &&
              queryParameters['type'] == null) {
            return Response(
              statusCode: 200,
              data: json.decode(
                await Converter.loadFromAsset(
                    'assets/mock/get_environments_profile_2.json'),
              ),
            );
          } else if (queryParameters != null &&
              queryParameters['profile'] == null &&
              queryParameters['type'] != null) {
            return Response(
              statusCode: 200,
              data: json.decode(
                await Converter.loadFromAsset(
                    'assets/mock/get_environments_type_1.json'),
              ),
            );
          } else if (queryParameters != null &&
              queryParameters['profile'] != null &&
              queryParameters['type'] != null) {
            return Response(
              statusCode: 200,
              data: json.decode(
                await Converter.loadFromAsset(
                    'assets/mock/get_environments_profile_2_type_1.json'),
              ),
            );
          }
          return Response(
            statusCode: 200,
            data: json.decode(
              await Converter.loadFromAsset(
                  'assets/mock/get_environments.json'),
            ),
          );
        case "/user":
          if (queryParameters != null &&
              queryParameters['id'] != null &&
              queryParameters['id'] > 0 &&
              queryParameters['id'] < 4) {
            return Response(
              statusCode: 200,
              data: json.decode(
                await Converter.loadFromAsset(
                    'assets/mock/get_profile_${queryParameters['id']}.json'),
              ),
            );
          }
          throw ServerException(statusCode: 400, message: "Invalid params");
        case "/program":
          return Response(
            statusCode: 200,
            data: json.decode(
              await Converter.loadFromAsset('assets/mock/programs.json'),
            ),
          );
        default:
          throw ServerException(statusCode: 400, message: "Invalid path $path");
      }
    } on PlatformException catch (e, stacktrace) {
      print(stacktrace);
      throw e;
    } catch (e, stacktrace) {
      print(stacktrace);
      logger.log(
        "Error: ${e.toString()}",
        name: "MockedConnection - GET",
      );
      throw GenericException();
    }
  }

  static Future<Response> post(
    String path, {
    bool withToken = false,
    dynamic data,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      switch (path) {
        case "/user":
          return Response(
            statusCode: 201,
            data: json.decode(
              await Converter.loadFromAsset(
                'assets/mock/post_profile.json',
              ),
            ),
          );
        case "/login":
          return Response(
            statusCode: 200,
            data: json.decode(
              await Converter.loadFromAsset(
                'assets/mock/get_profile_1.json',
              ),
            ),
          );
        default:
          throw ServerException(statusCode: 400, message: "Invalid path $path");
      }
    } on PlatformException catch (e, stacktrace) {
      throw e;
    } on ServerException catch (e, stacktrace) {
      throw ServerException(statusCode: e.statusCode, message: e.message);
    } catch (e, stacktrace) {
      logger.log(
        "Error: ${e.toString()}",
        name: "MockedConnection - POST",
      );
      throw GenericException();
    }
  }

  static Future<Response> put(
    String path, {
    bool withToken = false,
    dynamic data,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      switch (path) {
        case "/user":
          if (queryParameters['success'] != null && queryParameters['success'])
            return Response(statusCode: 201);
          throw ServerException(statusCode: 400, message: "Error updating");
        default:
          throw ServerException(statusCode: 400, message: "Invalid path $path");
      }
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

  static Future<Response> patch(
    String path, {
    bool withToken = false,
    dynamic data,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      switch (path) {
        case "/user":
          if (data != null && data['studyProfile'] != null)
            return Response(statusCode: 200);
          throw ServerException(
            statusCode: 400,
            message: "Cannot update field without value",
          );
        case "/user/1":
          if (data != null && data['studyProfile'] != null)
            return Response(statusCode: 200);
          throw ServerException(
            statusCode: 400,
            message: "Cannot update field without value",
          );
        case "/user/2":
          if (data != null && data['studyProfile'] != null)
            return Response(statusCode: 200);
          throw ServerException(
            statusCode: 400,
            message: "Cannot update field without value",
          );
        case "/user/3":
          if (data != null && data['studyProfile'] != null)
            return Response(statusCode: 200);
          throw ServerException(
            statusCode: 400,
            message: "Cannot update field without value",
          );
        default:
          throw ServerException(statusCode: 400, message: "Invalid path $path");
      }
    } on PlatformException catch (e, stacktrace) {
      throw e;
    } catch (e, stacktrace) {
      logger.log(
        "Error: ${e.toString()}",
        name: "Connection - PATCH",
      );
      throw GenericException();
    }
  }
}
