import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/usecases/ban_user_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/usecases/get_current_user_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/domain/usecases/report_user_usecase.dart';
import 'package:flutter/cupertino.dart';

class UserController extends ChangeNotifier {
  User? get user => _user;
  User? _user;

  GetCurrentUserUsecase getCurrentUserUsecase;
  ReportUserUsecase reportUserUsecase;
  BanUserUsecase banUserUsecase;


  UserController({
    required this.getCurrentUserUsecase,
    required this.reportUserUsecase,
    required this.banUserUsecase,
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



  Future<String> reportUser(BuildContext context, int userId) async {
    final localizations = AppLocalizations.of(context)!;

    try {
    await reportUserUsecase.execute(userId);
  } on HttpException catch (e) {
    return e.toString();
    } on NoInternetException catch (e) {
    return e.toString();
    }

    return localizations.user_reported;
  }

  Future<String> banUser(BuildContext context, int userId) async {
    final localizations = AppLocalizations.of(context)!;

    try {
      await banUserUsecase.execute(userId);
    } on HttpException catch (e) {
      return e.toString();
    } on NoInternetException catch (e) {
      return e.toString();
    }

    return localizations.user_banned;
  }
}
