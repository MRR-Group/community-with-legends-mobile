import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepository {
  Future<User> getUserProfile(int userId);

  Future<User> getCurrentUserProfile();

  Future<void> changeUserNickname(String nickname);

  Future<bool> changeUserAvatar(XFile avatar);

  Future<void> deleteUserAvatar();

  Future<List<Hardware>?> getUserHardware(int userId);

  Future<void> updateUserHardware(Hardware hardware);

  Future<void> deleteUserHardware(int id);

  Future<Hardware> addUserHardware(Hardware hardware);

  Future<List<UserGame>?> getUserGames(int userId);
}
