import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter/cupertino.dart';

class UserController extends ChangeNotifier {
  User? get user => _user;
  User? _user;

  GetCurrentUserUsecase getCurrentUserUsecase;

  UserController({
    required this.getCurrentUserUsecase,
  });

  void setUser(User user) {}

  Future<void> refreshUser() async {
    try {
      final newUser = await getCurrentUserUsecase.execute();

      _user = newUser;
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void clearUser() {
    _user = null;
  }
}
