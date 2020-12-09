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
        return "Lobo solitário";
      case StudyProfileEnum.JACK_OF_ALL_TRADES:
        return "Não tem tempo ruim";
      case StudyProfileEnum.OUTGOING:
        return "Da galera";
      case StudyProfileEnum.AVAILABLE:
        return "Ambientes Disponíveis";
    }
  }
}
