abstract class AuthRepository {
  Future<void> login(String email, String password);

  Future<String> register(String email, String name, String password);

  Future<void> sendResetToken(String email);

  Future<void> logout();

  void resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  });

  void setPassword({
    required String password,
    required String passwordConfirmation,
  });
}
