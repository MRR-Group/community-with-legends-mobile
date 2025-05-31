import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepository {
  Future<User> getUserProfile(int userId);

  Future<User> getCurrentUserProfile();

  Future<void> changeUserNickname(String nickname);

  Future<bool> changeUserAvatar(XFile avatar);

  Future<void> deleteUserAvatar();
}
