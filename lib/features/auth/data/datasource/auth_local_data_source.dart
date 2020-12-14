import 'dart:developer' as logger;

import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/settings.dart';
import 'package:estuduff/features/profile/data/model/study_profile_model.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUserToken(int token);
  Future<int> getToken();
  Future<void> cacheUserStudyProfile(StudyProfileEnum studyProfile);
  Future<StudyProfileEnum> getUserStudyProfile();
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

  @override
  Future<void> cacheUserStudyProfile(StudyProfileEnum studyProfile) {
    int profileId = studyProfile.getProfileId();
    Future<bool> result = sharedPreferences
        .setInt(
      Settings.CACHED_USER_STUDY_PROFILE_KEY,
      profileId,
    )
        .then((value) {
      print(
          "JP - ${sharedPreferences.getInt(Settings.CACHED_USER_STUDY_PROFILE_KEY)}");
    });
  }

  @override
  Future<StudyProfileEnum> getUserStudyProfile() async {
    try {
      if (sharedPreferences
          .containsKey(Settings.CACHED_USER_STUDY_PROFILE_KEY)) {
        var profileId =
            sharedPreferences.getInt(Settings.CACHED_USER_TOKEN_KEY);
        return StudyProfileModel.fromJson(profileId);
      } else
        return null;
    } catch (e) {
      logger.log(
        "Error: ${e.toString()}",
        name: "AuthLocalDataSourceImpl - getUserToken",
      );
      throw CacheException();
    }
  }

  @override
  Future<bool> cleanCache() async {
    bool isCleared = await sharedPreferences.clear();
    if (!isCleared) {
      throw CacheException();
    }
    return isCleared;
  }
}
