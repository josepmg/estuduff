enum StudyProfileEnum {
  LONELY_WOLF,
  JACK_OF_ALL_TRADES,
  OUTGOING,
}

extension StudyProfileEnumExtension on StudyProfileEnum {
  int getProfileId() {
    switch (this) {
      case StudyProfileEnum.LONELY_WOLF:
        return 1;
      case StudyProfileEnum.JACK_OF_ALL_TRADES:
        return 2;
      case StudyProfileEnum.OUTGOING:
        return 3;
    }
  }

  String getProfileName() {
    switch (this) {
      case StudyProfileEnum.LONELY_WOLF:
        return "Lobo solitário";
      case StudyProfileEnum.JACK_OF_ALL_TRADES:
        return "Não tem tempo ruim";
      case StudyProfileEnum.OUTGOING:
        return "Da galera";
    }
  }
}
