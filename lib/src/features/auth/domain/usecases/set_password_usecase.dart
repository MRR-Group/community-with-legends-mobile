import 'package:community_with_legends_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class SetPasswordUsecase {
  final AuthRepository repository;

  SetPasswordUsecase(this.repository);

  Future<void> execute({
    required String password,
    required String passwordConfirmation,
  }) async {
    return repository.setPassword(
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
