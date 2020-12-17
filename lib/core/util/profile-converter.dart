import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/material.dart';

class ProfileConverter {
  static Color recoverProfileColor(StudyProfileEnum profile) {
    if (profile == StudyProfileEnum.OUTGOING) {
      return ColorsEstudUff.primaryRed;
    } else if (profile == StudyProfileEnum.LONELY_WOLF) {
      return ColorsEstudUff.primaryBlue;
    } else if (profile == StudyProfileEnum.JACK_OF_ALL_TRADES) {
      return ColorsEstudUff.primaryGreen;
    } else {
      return ColorsEstudUff.lightGrey;
    }
  }

  static String recoverProfileIcon(StudyProfileEnum profile) {
    if (profile == StudyProfileEnum.JACK_OF_ALL_TRADES) {
      return StringsEstudUff.jack_env_icon;
    } else if (profile == StudyProfileEnum.LONELY_WOLF) {
      return StringsEstudUff.wolf_env_icon;
    } else if (profile == StudyProfileEnum.OUTGOING) {
      return StringsEstudUff.outgoing_env_icon;
    } else {
      return StringsEstudUff.available_env_icon;
    }
  }

  static String recoverStudyProfile(StudyProfileEnum profile) {
    if (profile == StudyProfileEnum.JACK_OF_ALL_TRADES) {
      return StringsEstudUff.jack_profile;
    } else if (profile == StudyProfileEnum.LONELY_WOLF) {
      return StringsEstudUff.wolf_profile;
    } else if (profile == StudyProfileEnum.OUTGOING) {
      return StringsEstudUff.outgoing_profile;
    } else {
      return StringsEstudUff.available_title;
    }
  }
}
