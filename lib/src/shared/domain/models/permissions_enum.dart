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
  updateGames,
  manageReports,
  renameUsers,
  changeUsersAvatar,
  deleteUserHardware,
  viewLogs;

  static Permission fromString(String value) {
    return Permission.values.firstWhere((e) => e.name == value);
  }
}
