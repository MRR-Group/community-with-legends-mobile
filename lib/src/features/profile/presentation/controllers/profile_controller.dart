import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_current_user_usecase.dart';
import 'package:community_with_legends_mobile/src/features/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';

class ProfileController extends ChangeNotifier{
  GetUserProfileUsecase getUserProfileUsecase;
  GetCurrentUserProfileUsecase getCurrentUserProfileUsecase;

  ProfileController({ required this.getUserProfileUsecase, required this.getCurrentUserProfileUsecase });

  Future<User?> getUserProfileById(BuildContext context, int userId) async {
    try {
      return  getUserProfileUsecase.execute(userId);
    } on HttpException catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: error.message);
      }
      return null;
    }
  }

  Future<User?> getCurrentUserProfile(BuildContext context) async {
    try {
      return  getCurrentUserProfileUsecase.execute();
    } on HttpException catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: error.message);
      }
      return null;
    }
  }

}
