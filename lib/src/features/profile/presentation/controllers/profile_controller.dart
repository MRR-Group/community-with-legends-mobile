import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/game_proposal_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/hardware_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_game_status_enum.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/models/user_profile_model.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/accept_proposal_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/add_user_game_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/add_user_hardware_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/change_user_avatar_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/change_user_nickname_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/create_proposal_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/delete_user_avatar_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/delete_user_game_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/delete_user_hardware_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/dislike_proposal_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_current_user_profile_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_games_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_hardware_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_proposals_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/like_proposal_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/reject_proposal_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/remove_proposal_vote_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/update_user_hardware_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/game_model.dart';
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
  GetUserGamesUsecase getUserGamesUsecase;
  DeleteUserGameUsecase deleteUserGameUsecase;
  AddUserGameUsecase addUserGameUsecase;
  GetUserProposalsUsecase getUserProposalsUsecase;
  AcceptProposalUsecase acceptProposalUsecase;
  CreateProposalUsecase createProposalUsecase;
  DislikeProposalUsecase dislikeProposalUsecase;
  LikeProposalUsecase likeProposalUsecase;
  RejectProposalUsecase rejectProposalUsecase;
  RemoveProposalVoteUsecase removeProposalVoteUsecase;

  bool get isEditingProfile => _isEditingProfile;
  bool _isEditingProfile = false;

  bool get isEditingHardware => _isEditingHardware;
  bool _isEditingHardware = false;

  bool get isEditingWantToPlay => _isEditingWantToPlay;
  bool _isEditingWantToPlay = false;

  bool get isEditingPlaying => _isEditingPlaying;
  bool _isEditingPlaying = false;

  bool get isEditingPlayed => _isEditingPlayed;
  bool _isEditingPlayed = false;

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
    required this.getUserGamesUsecase,
    required this.deleteUserGameUsecase,
    required this.addUserGameUsecase,
    required this.getUserProposalsUsecase,
    required this.acceptProposalUsecase,
    required this.createProposalUsecase,
    required this.dislikeProposalUsecase,
    required this.likeProposalUsecase,
    required this.rejectProposalUsecase,
    required this.removeProposalVoteUsecase,
  });

  Future<UserProfile?> getUserProfileById(
    BuildContext context,
    int userId,
  ) async {
    try {
      final user = await getUserProfileUsecase.execute(userId);
      final hardware = await getUserHardwareUsecase.execute(userId);
      final userGames = await getUserGamesUsecase.execute(userId);
      final userProposals = await getUserProposalsUsecase.execute(userId);

      userProfile = UserProfile(
        user: user,
        hardware: hardware,
        userGames: userGames,
        gameProposals: userProposals,
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
      final userGames = await getUserGamesUsecase.execute(user.id);
      final userProposals = await getUserProposalsUsecase.execute(user.id);

      userProfile = UserProfile(
        user: user,
        hardware: hardware,
        userGames: userGames,
        gameProposals: userProposals,
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
      await changeUserNicknameUsecase.execute(nickname);
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

  Future<void> openGameCategoryEditMenu(UserGameStatus status) async {
    switch (status) {
      case UserGameStatus.to_play:
        _isEditingWantToPlay = true;
        break;
      case UserGameStatus.playing:
        _isEditingPlaying = true;
        break;
      case UserGameStatus.played:
        _isEditingPlayed = true;
        break;
    }

    notifyListeners();
  }

  Future<void> closeGameCategoryEditMenu(UserGameStatus status) async {
    switch (status) {
      case UserGameStatus.to_play:
        _isEditingWantToPlay = false;
        break;
      case UserGameStatus.playing:
        _isEditingPlaying = false;
        break;
      case UserGameStatus.played:
        _isEditingPlayed = false;
        break;
    }

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
      await deleteUserAvatarUsecase.execute();
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    imageCache.clear();
    closeUserEditMenu();

    return localizations.profile_avatarDeleted;
  }

  Future<String> deleteGame(
    BuildContext context,
    int userGameId,
    UserGameStatus status,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await deleteUserGameUsecase.execute(userGameId);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    closeGameCategoryEditMenu(status);

    return localizations.profile_gameDeleted;
  }

  Future<String> addGame(
    BuildContext context,
    int gameId,
    UserGameStatus status,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await addUserGameUsecase.execute(gameId, status);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    closeGameCategoryEditMenu(status);

    return localizations.profile_gameAdded;
  }

  Future<String> acceptProposal(
    BuildContext context,
    GameProposal gameProposal,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await acceptProposalUsecase.execute(gameProposal.id);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    notifyListeners();

    return localizations.profile_suggestionAccepted;
  }

  Future<String> rejectProposal(
    BuildContext context,
    GameProposal gameProposal,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await rejectProposalUsecase.execute(gameProposal.id);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    notifyListeners();

    return localizations.profile_suggestionRejected;
  }

  Future<String> voteForProposal(
    BuildContext context,
    GameProposal gameProposal,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await likeProposalUsecase.execute(gameProposal.id);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    notifyListeners();

    return localizations.profile_suggestionVotedFor;
  }

  Future<String> voteAgainstProposal(
    BuildContext context,
    GameProposal gameProposal,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await dislikeProposalUsecase.execute(gameProposal.id);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    notifyListeners();

    return localizations.profile_suggestionVotedAgainst;
  }

  Future<String> removeProposalVote(
    BuildContext context,
    GameProposal gameProposal,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await removeProposalVoteUsecase.execute(gameProposal.id);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    notifyListeners();

    return localizations.profile_suggestionRemoveVote;
  }

  Future<String> suggestGame(
    BuildContext context,
    Game game,
    User user,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await createProposalUsecase.execute(
        user.id,
        game.id,
      );
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    notifyListeners();

    return localizations.profile_suggestionCreated;
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
