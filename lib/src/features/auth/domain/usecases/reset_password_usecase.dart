import 'package:community_with_legends_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository repository;

  ResetPasswordUsecase(this.repository);

  Future<void> execute({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    repository.resetPassword(
      email: email,
      token: token,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
