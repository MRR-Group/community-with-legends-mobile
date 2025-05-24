import 'package:community_with_legends_mobile/l10n/generated/app_localizations.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/send_reset_token_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController with ChangeNotifier {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUseCase registerUseCase;
  final SendResetTokenUsecase sendResetTokenUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;


  bool _isLoading = false;

  bool get isLoading => _isLoading;

  AuthController({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.registerUseCase,
    required this.resetPasswordUsecase,
    required this.sendResetTokenUsecase,
  });

  Future<bool> get isLoggedIn async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    return token != null;
  }

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await loginUseCase.execute(email, password);

      if (context.mounted) {
        final localizations = AppLocalizations.of(context)!;

        Alert.of(context).show(text: localizations.login_loggedIn);
        Navigator.pushReplacementNamed(context, '/feed');
      }
    } catch (error) {
      if (context.mounted) {
        Alert.of(context).show(text: '$error');
      }
    }

    _isLoading = false;
    notifyListeners();
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

    _isLoading = false;
    notifyListeners();
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

    _isLoading = false;
    notifyListeners();
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

    _isLoading = false;
    notifyListeners();
  }
}
