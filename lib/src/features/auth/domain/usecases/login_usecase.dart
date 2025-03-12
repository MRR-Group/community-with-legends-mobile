import 'package:community_with_legends_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<String> execute(String email, String password) {
    return repository.login(email, password);
  }
}