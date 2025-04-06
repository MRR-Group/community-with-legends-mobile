import 'package:community_with_legends_mobile/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class RegisterController with ChangeNotifier {
  final RegisterUseCase registerUseCase;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  RegisterController(this.registerUseCase);

  Future<void> register(BuildContext context, String email, String name, String password, String confirmPassword) async {
    _isLoading = true;
    notifyListeners();

    try{
      await registerUseCase.execute(email, name, password);

      if(context.mounted){
        Alert.of(context).show(text: 'Registration completed successfully. Now you can log in');
      }
    }catch (error){
      if(context.mounted){
        Alert.of(context).show(text: '$error');
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}