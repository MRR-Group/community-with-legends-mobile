import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/profile/data/data_sources/profile_datasource.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/local/local_user_data_source_impl.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileDatasource profileDatasource;
  LocalUserDataSourceImpl localUserDataSourceImpl;

  ProfileRepositoryImpl(this.profileDatasource, this.localUserDataSourceImpl);

  @override
  Future<User> getUserProfile(int userId) async {
    final response = await profileDatasource.getUserProfile(userId);
    final user = User.fromJson(response['data']);

    return user;
  }

  @override
  Future<User> getCurrentUserProfile() async {
    User user;
    try {
      final response = await profileDatasource.getCurrentUserProfile();

      user = User.fromJson(response['data']);

      localUserDataSourceImpl.cacheUser(user);
    } on NoInternetException {
      user = await localUserDataSourceImpl.getCurrentUser();
    }

    return user;
  }

  @override
  Future<void> changeUserNickname(String nickname) async {
    await profileDatasource.changeUserNickname(nickname);
  }

  @override
  Future<bool> changeUserAvatar(XFile avatar) async {
    return profileDatasource.changeUserAvatar(avatar);
  }

  @override
  Future<void> deleteUserAvatar() async {
    await profileDatasource.deleteUserAvatar();
  }

  @override
  Future<List<Hardware>> getUserHardware(int userId) async {
    List<Hardware> hardware;
    try {
      final response = await profileDatasource.getUserHardware(userId);
      final data = response['data'] as List<dynamic>;

      hardware = data.map((item) => Hardware.fromJson(item)).toList();

      localUserDataSourceImpl.cacheUserHardware(userId, hardware);
    } on NoInternetException {
      hardware = await localUserDataSourceImpl.getUserHardwareById(userId);
    }

    return hardware;
  }

  @override
  Future<void> updateUserHardware(Hardware hardware) async {
    await profileDatasource.updateUserHardware(hardware);
  }

  @override
  Future<void> deleteUserHardware(int id) async {
    await profileDatasource.deleteUserHardware(id);
  }

  @override
  Future<Hardware> addUserHardware(Hardware hardware) async {
    final response = await profileDatasource.addUserHardware(hardware);
    final data = response;

    hardware = Hardware.fromJson(data);

    return hardware;
  }

  @override
  Future<List<UserGame>?> getUserGames(int userId) async {
    final response = await profileDatasource.getUserGames(userId);
    final data = response['data'] as List<dynamic>;
    final userGames = data.map((item) => UserGame.fromJson(item)).toList();

    return userGames;
  }

  @override
  Future<void> deleteUserGame(int id) async {
    await profileDatasource.deleteUserGame(id);
  }

  @override
  Future<void> addUserGame(int gameId, UserGameStatus status) async {
    await profileDatasource.addGameToUserList(gameId, status);
  }

  @override
  Future<List<GameProposal>?> getUserProposals(int userId) async {
    final response = await profileDatasource.getUserProposals(userId);
    final data = response['data'] as List<dynamic>;
    final gameProposals = data.map((item) => GameProposal.fromJson(item)).toList();

    return gameProposals;
  }
}
