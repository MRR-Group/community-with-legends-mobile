enum GameProposalStatus {
  pending,
  accepted,
  rejected;

  static GameProposalStatus fromString(String value) {
    return GameProposalStatus.values.firstWhere((e) => e.name == value);
  }
}
