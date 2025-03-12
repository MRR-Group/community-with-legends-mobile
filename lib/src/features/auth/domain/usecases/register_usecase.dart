import 'package:community_with_legends_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<String> execute(String email, String name, String password) {
    return repository.register(email, name, password);
  }
}