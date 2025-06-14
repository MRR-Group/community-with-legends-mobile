import 'package:community_with_legends_mobile/src/core/errors/exceptions/auth_exception.dart';
import 'package:community_with_legends_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:community_with_legends_mobile/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/local/local_user_data_source_impl.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/remote/remote_user_data_source_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource api;
  final UserDataSourceImpl remoteUserDataSource;
  final LocalUserDataSourceImpl localUserDataSource;

  AuthRepositoryImpl(
    this.api,
    this.remoteUserDataSource,
    this.localUserDataSource,
  );

  @override
  Future<void> login(String email, String password) async {
    final response = await api.login(email, password);

    if (response.containsKey('token')) {
      final token = response['token'];

      await _saveToken(token);
      await _cacheUser();
    } else {
      throw AuthException(response['message'] ?? 'Login failed');
    }
  }

  @override
  Future<String> register(String email, String name, String password) async {
    final response = await api.register(email, name, password);

    if (response.containsValue('success')) {
      return response['message'];
    } else {
      throw AuthException(response['message'] ?? 'Registration failed');
    }
  }

  @override
  Future<void> sendResetToken(String email) async {
    api.sendResetToken(email);
  }

  @override
  void resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) {
    api.resetPassword(
      email: email,
      token: token,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }

  @override
  Future<void> logout() async {
    api.logout();
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> _cacheUser() async {
    final user = await remoteUserDataSource.getCurrentUser();
    localUserDataSource.cacheUser(user);
  }

  @override
  Future<void> setPassword({
    required String password,
    required String passwordConfirmation,
  }) async {
    return api.setPassword(
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
