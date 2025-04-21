import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/send_reset_token_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class ResetPasswordController with ChangeNotifier {
  final SendResetTokenUsecase resetTokenUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ResetPasswordController(this.resetTokenUsecase, this.resetPasswordUsecase);

  Future<void> sendResetTokenEmail(
    BuildContext context,
    String email,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await resetTokenUsecase.execute(email);

      if (context.mounted) {
        Alert.of(context).show(
          text:
          'If the email is correct, a token to reset your password will be sent to it',
        );

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
        Alert.of(context).show(
          text: 'Success! You can now log in with your new password',
        );
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
