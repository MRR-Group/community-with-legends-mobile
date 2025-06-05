import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/send_reset_token_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/set_password_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/controllers/user_controller.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController with ChangeNotifier {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUseCase registerUseCase;
  final SendResetTokenUsecase sendResetTokenUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  final SetPasswordUsecase setPasswordUsecase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  AuthController({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.registerUseCase,
    required this.resetPasswordUsecase,
    required this.sendResetTokenUsecase,
    required this.setPasswordUsecase,
  });

  Future<bool> get isLoggedIn async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    return token != null;
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
    required void Function() onLoginSuccess,
  }) async {
    final localizations = AppLocalizations.of(context)!;
    _isLoading = true;
    notifyListeners();

    try {
      await loginUseCase.execute(email, password);

      if (context.mounted) {
        final localizations = AppLocalizations.of(context)!;

        onLoginSuccess();

        Alert.of(context).show(text: localizations.login_loggedIn);
        Navigator.pushReplacementNamed(context, '/feed');
      }
    } on NoInternetException catch (e) {
      _endLoading();

      if (context.mounted) {
        Alert.of(context).show(text: e.toString());
      }
    } on HttpException catch (e) {
      _endLoading();

      if(e.statusCode == 403){
        Alert.of(context).show(text: localizations.login_invalidCredentials);
        return;
      }

      if (context.mounted) {
        Alert.of(context).show(text: e.toString());
      }
    } catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: '$error');
      }
    }

    _endLoading();
  }

  Future<void> logout(
    BuildContext context,
  ) async {
    try {
      await logoutUseCase.execute();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');

      if (context.mounted) {
        final localizations = AppLocalizations.of(context)!;

        Alert.of(context).show(text: localizations.logout_loggedOut);
        Navigator.pushReplacementNamed(context, '/feed');
      }
    } catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: '$error');
      }
    }
  }

  Future<void> register(
    BuildContext context,
    String email,
    String name,
    String password,
    String confirmPassword,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await registerUseCase.execute(email, name, password);

      if (context.mounted) {
        final localizations = AppLocalizations.of(context)!;
        Alert.of(context).show(text: localizations.register_registered);
      }
    } catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: '$error');
      }
    }

    _endLoading();
  }

  Future<void> sendResetTokenEmail(
    BuildContext context,
    String email,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await sendResetTokenUsecase.execute(email);

      if (context.mounted) {
        final localizations = AppLocalizations.of(context)!;

        Alert.of(context).show(text: localizations.rp_tokenSent);
        Navigator.of(context).pushNamed('/reset-password');
      }
    } catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: '$error');
      }
    }

    _endLoading();
  }

  Future<void> resetPassword({
    required BuildContext context,
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      await resetPasswordUsecase.execute(
        email: email,
        token: token,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      if (context.mounted) {
        final localizations = AppLocalizations.of(context)!;

        Alert.of(context).show(text: localizations.rp_passwordReset);
        Navigator.of(context).pushNamed('/login');
      }
    } catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: '$error');
      }
    }
  }

  Future<String> setPassword({
    required BuildContext context,
    required String password,
    required String passwordConfirmation,
  }) async {
    final localizations = AppLocalizations.of(context)!;
    _isLoading = true;
    notifyListeners();

    try {
      await setPasswordUsecase.execute(
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
    } on NoInternetException catch (e) {
      _endLoading();

      return e.toString();
    } on HttpException catch (e) {
      _endLoading();

      return e.toString();
    }

    final userController = Provider.of<UserController>(context, listen: false);
    await userController.refreshUser();

    _endLoading();
    Navigator.of(context).pushReplacementNamed('/feed');

    return localizations.passwordSet;
  }
  void _endLoading(){
    _isLoading = false;
    notifyListeners();
  }
}
