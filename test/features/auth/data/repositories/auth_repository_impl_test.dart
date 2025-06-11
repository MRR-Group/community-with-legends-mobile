import 'package:community_with_legends_mobile/src/core/errors/exceptions/auth_exception.dart';
import 'package:community_with_legends_mobile/src/features/auth/data/data_sources/auth_data_source.dart';
import 'package:community_with_legends_mobile/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/local/local_user_data_source_impl.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/remote/remote_user_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([
  AuthDataSource,
  UserDataSourceImpl,
  LocalUserDataSourceImpl,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();


  late AuthRepositoryImpl repository;
  late MockAuthDataSource mockApi;
  late MockUserDataSourceImpl mockRemoteUserDataSource;
  late MockLocalUserDataSourceImpl mockLocalUserDataSource;

  setUp(() {
    mockApi = MockAuthDataSource();
    mockRemoteUserDataSource = MockUserDataSourceImpl();
    mockLocalUserDataSource = MockLocalUserDataSourceImpl();

    repository = AuthRepositoryImpl(
      mockApi,
      mockRemoteUserDataSource,
      mockLocalUserDataSource,
    );
  });

  test('login throws AuthException when credentials are invalid', () async {
    when(mockApi.login('email@test.com', 'wrong')).thenAnswer(
          (_) async => {'message': 'Invalid credentials'},
    );

    expect(
          () => repository.login('email@test.com', 'wrong'),
      throwsA(isA<AuthException>()),
    );
  });

  test('register returns message on success', () async {
    when(mockApi.register('test@test.com', 'Test', 'pass123')).thenAnswer(
          (_) async => {'status': 'success', 'message': 'Registered successfully'},
    );

    final result = await repository.register('test@test.com', 'Test', 'pass123');

    expect(result, 'Registered successfully');
  });

  test('register throws AuthException when not successful', () async {
    when(mockApi.register('test@test.com', 'Test', 'pass123')).thenAnswer(
          (_) async => {'message': 'Email already taken'},
    );

    expect(
          () => repository.register('test@test.com', 'Test', 'pass123'),
      throwsA(isA<AuthException>()),
    );
  });

  test('sendResetToken calls API with email', () async {
    when(mockApi.sendResetToken('test@test.com')).thenAnswer((_) async => {});

    await repository.sendResetToken('test@test.com');

    verify(mockApi.sendResetToken('test@test.com')).called(1);
  });

  test('resetPassword calls API with correct params', () {
    when(mockApi.resetPassword(
      email: 'test@test.com',
      token: 'abc',
      password: 'newpass',
      passwordConfirmation: 'newpass',
    ),).thenReturn(null);

    repository.resetPassword(
      email: 'test@test.com',
      token: 'abc',
      password: 'newpass',
      passwordConfirmation: 'newpass',
    );

    verify(mockApi.resetPassword(
      email: 'test@test.com',
      token: 'abc',
      password: 'newpass',
      passwordConfirmation: 'newpass',
    ),).called(1);
  });

  test('logout calls API', () {
    when(mockApi.logout()).thenReturn(null);

    repository.logout();

    verify(mockApi.logout()).called(1);
  });

  test('setPassword calls API with correct params', () async {
    when(mockApi.setPassword(
      password: '123456',
      passwordConfirmation: '123456',
    ),).thenAnswer((_) async => {});

    await repository.setPassword(
      password: '123456',
      passwordConfirmation: '123456',
    );

    verify(mockApi.setPassword(
      password: '123456',
      passwordConfirmation: '123456',
    ),).called(1);
  });
}
