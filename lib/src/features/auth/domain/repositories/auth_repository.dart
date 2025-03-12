abstract class AuthRepository {
  Future<String> login(String email, String password);
  Future<String> register(String email, String name, String password);
}