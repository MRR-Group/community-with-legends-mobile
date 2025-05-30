import 'package:community_with_legends_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> execute(String email, String password) async {
    await repository.login(email, password);
  }
}
