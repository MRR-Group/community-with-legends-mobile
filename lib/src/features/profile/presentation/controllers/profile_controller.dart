import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_profile_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/change_user_avatar_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/change_user_nickname_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/delete_user_avatar_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_current_user_profile_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_hardware_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileController extends ChangeNotifier {
  GetUserProfileUsecase getUserProfileUsecase;
  GetCurrentUserProfileUsecase getCurrentUserProfileUsecase;
  ChangeUserNicknameUsecase changeUserNicknameUsecase;
  ChangeUserAvatarUsecase changeUserAvatarUsecase;
  DeleteUserAvatarUsecase deleteUserAvatarUsecase;
  GetUserHardwareUsecase getUserHardwareUsecase;

  bool get isEditingProfile => _isEditingProfile;
  bool _isEditingProfile = false;

  ProfileController({
    required this.getUserProfileUsecase,
    required this.getCurrentUserProfileUsecase,
    required this.changeUserNicknameUsecase,
    required this.changeUserAvatarUsecase,
    required this.deleteUserAvatarUsecase,
    required this.getUserHardwareUsecase,
  });

  Future<UserProfile?> getUserProfileById(
    BuildContext context,
    int userId,
  ) async {
    try {
      final user = await getUserProfileUsecase.execute(userId);

      final userProfile = UserProfile(user: user);

      return userProfile;
    } on HttpException catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: error.message);
      }
      return null;
    }
  }

  Future<UserProfile?> getCurrentUserProfile(BuildContext context) async {
    try {
      final user = await getCurrentUserProfileUsecase.execute();
      final hardware = await getUserHardwareUsecase.execute(user.id);

      final userProfile = UserProfile(
        user: user,
        hardware: hardware,
      );

      return userProfile;
    } on HttpException catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: error.message);
      }
      return null;
    }
  }

  Future<String> changeNickname(
    BuildContext context,
    String nickname,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      changeUserNicknameUsecase.execute(nickname);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    closeUserEditMenu();
    return localizations.profile_nicknameChanged;
  }

  Future<void> openUserEditMenu() async {
    _isEditingProfile = true;
    notifyListeners();
  }

  Future<void> closeUserEditMenu() async {
    _isEditingProfile = false;
    notifyListeners();
  }

  Future<void> editUserProfile(String nickname) async {
    _isEditingProfile = false;
    notifyListeners();
  }

  Future<String?> pickAvatar(
    BuildContext context,
    ImageSource imageSource,
  ) async {
    final localizations = AppLocalizations.of(context)!;
    final ImagePicker picker = ImagePicker();

    try {
      final XFile? image = await picker.pickImage(source: imageSource);

      if (image == null) {
        return null;
      }

      debugPrint('Selected image: ${image.path}');
      final result = await changeUserAvatarUsecase.execute(image);

      if (result == false) {
        return localizations.profile_avatarUploadFailed;
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      imageCache.clear();
      closeUserEditMenu();
    }

    return localizations.profile_avatarUploaded;
  }

  Future<String> deleteAvatar(
    BuildContext context,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      deleteUserAvatarUsecase.execute();
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    imageCache.clear();
    closeUserEditMenu();

    return localizations.profile_avatarDeleted;
  }

  Future<String?> handlePopupMenu(
    BuildContext context,
    String value,
    User user,
  ) async {
    final localizations = AppLocalizations.of(context)!;
    final userController = Provider.of<UserController>(context, listen: false);

    switch (value) {
      case 'report':
        return userController.reportUser(context, user.id);
      case 'ban':
        return userController.banUser(context, user.id);
      case 'edit':
        openUserEditMenu();
        return null;
      default:
        return localizations.unexpectedError;
    }
  }
}
