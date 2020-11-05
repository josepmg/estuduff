import 'dart:developer' as logger;

import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUserToken(int token);
  Future<int> getToken();
  Future<bool> cleanCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheUserToken(int token) {
    return sharedPreferences.setInt(Settings.CACHED_USER_TOKEN_KEY, token);
  }

  @override
  Future<bool> cleanCache() async {
    bool isCleared = await sharedPreferences.clear();
    if (!isCleared) {
      throw CacheException();
    }
    return isCleared;
  }

  @override
  Future<int> getToken() async {
    try {
      return sharedPreferences.containsKey(Settings.CACHED_USER_TOKEN_KEY)
          ? sharedPreferences.getInt(Settings.CACHED_USER_TOKEN_KEY)
          : null;
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "AuthLocalDataSourceImpl - getUserToken",
      );
      throw CacheException();
    }
  }
}
