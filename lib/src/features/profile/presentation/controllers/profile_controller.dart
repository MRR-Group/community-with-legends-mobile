import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/change_user_nickname_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_current_user_profile_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProfileController extends ChangeNotifier {
  GetUserProfileUsecase getUserProfileUsecase;
  GetCurrentUserProfileUsecase getCurrentUserProfileUsecase;
  ChangeUserNicknameUsecase changeUserNicknameUsecase;

  bool get isEditingProfile => _isEditingProfile;
  bool _isEditingProfile = false;

  ProfileController({
    required this.getUserProfileUsecase,
    required this.getCurrentUserProfileUsecase,
    required this.changeUserNicknameUsecase,
  });

  Future<User?> getUserProfileById(BuildContext context, int userId) async {
    try {
      return getUserProfileUsecase.execute(userId);
    } on HttpException catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: error.message);
      }
      return null;
    }
  }

  Future<User?> getCurrentUserProfile(BuildContext context) async {
    try {
      return getCurrentUserProfileUsecase.execute();
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
