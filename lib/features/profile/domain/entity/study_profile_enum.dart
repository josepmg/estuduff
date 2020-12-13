import 'package:estuduff/core/resource/strings_estuduff.dart';

enum StudyProfileEnum {
  LONELY_WOLF,
  JACK_OF_ALL_TRADES,
  OUTGOING,
  AVAILABLE,
}

extension StudyProfileEnumExtension on StudyProfileEnum {
  int getProfileId() {
    switch (this) {
      case StudyProfileEnum.LONELY_WOLF:
        return 1;
        break;
      case StudyProfileEnum.JACK_OF_ALL_TRADES:
        return 2;
        break;
      case StudyProfileEnum.OUTGOING:
        return 3;
        break;
      case StudyProfileEnum.AVAILABLE:
        return 4;
        break;
    }
  }

  String getProfileName() {
    switch (this) {
      case StudyProfileEnum.LONELY_WOLF:
        return StringsEstudUff.wolf_profile;
      case StudyProfileEnum.JACK_OF_ALL_TRADES:
        return StringsEstudUff.jack_profile;
      case StudyProfileEnum.OUTGOING:
        return StringsEstudUff.outgoing_profile;
      case StudyProfileEnum.AVAILABLE:
        return StringsEstudUff.available_title;
    }
  }
}
