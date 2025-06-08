enum UserGameStatus {
  // ignore: constant_identifier_names
  to_play,
  playing,
  played;

  static UserGameStatus fromString(String value) {
    return UserGameStatus.values.firstWhere((e) => e.name == value);
  }
}
