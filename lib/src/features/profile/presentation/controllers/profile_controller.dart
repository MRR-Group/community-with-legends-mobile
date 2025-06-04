import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_profile_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/add_user_hardware_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/change_user_avatar_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/change_user_nickname_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/delete_user_avatar_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/delete_user_hardware_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_current_user_profile_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_hardware_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/update_user_hardware_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileController extends ChangeNotifier {
  GetUserProfileUsecase getUserProfileUsecase;
  GetCurrentUserProfileUsecase getCurrentUserProfileUsecase;
  ChangeUserNicknameUsecase changeUserNicknameUsecase;
  ChangeUserAvatarUsecase changeUserAvatarUsecase;
  DeleteUserAvatarUsecase deleteUserAvatarUsecase;
  GetUserHardwareUsecase getUserHardwareUsecase;
  UpdateUserHardwareUsecase updateUserHardwareUsecase;
  DeleteUserHardwareUsecase deleteUserHardwareUsecase;
  AddUserHardwareUsecase addUserHardwareUsecase;

  bool get isEditingProfile => _isEditingProfile;
  bool _isEditingProfile = false;

  bool get isEditingHardware => _isEditingHardware;
  bool _isEditingHardware = false;

  UserProfile? userProfile;

  ProfileController({
    required this.getUserProfileUsecase,
    required this.getCurrentUserProfileUsecase,
    required this.changeUserNicknameUsecase,
    required this.changeUserAvatarUsecase,
    required this.deleteUserAvatarUsecase,
    required this.getUserHardwareUsecase,
    required this.updateUserHardwareUsecase,
    required this.deleteUserHardwareUsecase,
    required this.addUserHardwareUsecase,
  });

  Future<UserProfile?> getUserProfileById(
    BuildContext context,
    int userId,
  ) async {
    try {
      final user = await getUserProfileUsecase.execute(userId);
      final hardware = await getUserHardwareUsecase.execute(userId);

      userProfile = UserProfile(
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

  Future<String> updateUserHardware(
    BuildContext context,
    Hardware newHardware,
    Hardware oldHardware,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      if (newHardware.id != null) {
        await updateUserHardwareUsecase.execute(newHardware);
      } else {
        newHardware = await addUserHardwareUsecase.execute(newHardware);
      }
    } on HttpException catch (e) {
      return e.message;
    } on NoInternetException catch (e) {
      return e.toString();
    }

    final index = _getHardwareIndex(oldHardware);

    if (index == -1) {
      return localizations.profile_componentNotFound;
    }

    userProfile!.hardware![index] = newHardware;
    notifyListeners();

    return localizations.profile_componentUpdated;
  }

  Future<String> deleteHardwareComponent(
    BuildContext context,
    Hardware hardware,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      if (hardware.id != null) {
        await deleteUserHardwareUsecase.execute(hardware.id!);
      }
    } on HttpException catch (e) {
      return e.message;
    } on NoInternetException catch (e) {
      return e.toString();
    }

    final index = _getHardwareIndex(hardware);

    if (index == -1) {
      return localizations.profile_componentNotFound;
    }

    userProfile!.hardware!.removeAt(index);
    notifyListeners();

    return localizations.profile_componentDeleted;
  }

  Future<UserProfile?> getCurrentUserProfile(BuildContext context) async {
    try {
      final user = await getCurrentUserProfileUsecase.execute();
      final hardware = await getUserHardwareUsecase.execute(user.id);

      userProfile = UserProfile(
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

  Future<void> openHardwareEditMenu() async {
    _isEditingHardware = true;
    notifyListeners();
  }

  Future<void> closeHardwareEditMenu() async {
    _isEditingHardware = false;
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
      final compressedImage = await _compressImage(image);

      if (compressedImage == null) {
        return localizations.profile_avatarUploadFailed;
      }
      final result = await changeUserAvatarUsecase.execute(compressedImage);

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

  int _getHardwareIndex(Hardware hardware) {
    if (userProfile?.hardware == null) {
      return -1;
    }

    return userProfile!.hardware!.indexOf(hardware);
  }
  Future<XFile?> _compressImage(XFile file) async {
    final result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      '${file.path}_compressed.jpg',
      quality: 100,
      minWidth: 256,
      minHeight: 256,
    );
    return result;
  }
}
