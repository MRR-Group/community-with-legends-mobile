import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController with ChangeNotifier {
  final LoginUseCase loginUseCase;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  LoginController(this.loginUseCase);

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      final token = await loginUseCase.execute(email, password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      if (context.mounted) {
        Alert.of(context).show(text: 'Logged in successfully');
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
}
