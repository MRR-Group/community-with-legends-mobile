enum Permission {
  createPost,
  makeComment,
  reactToPost,
  banUsers,
  viewUsers,
  deletePosts,
  anonymizeUsers,
  manageAdministrators,
  manageModerators,
  updateGames;

  static Permission fromString(String value) {
    return Permission.values.firstWhere((e) => e.name == value);
  }
}
