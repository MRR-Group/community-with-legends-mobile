import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/send_reset_token_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class ResetPasswordController with ChangeNotifier {
  final SendResetTokenUsecase resetTokenUsecase;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ResetPasswordController(this.resetTokenUsecase);

  Future<void> sendResetTokenEmail(
    BuildContext context,
    String email,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      await resetTokenUsecase.execute(email);

      if (context.mounted) {
        Alert.of(context).show(text: 'If the email is correct, a token to reset your password will be sent to it');
        Navigator.of(context).pushNamed('/forgot-password');
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
