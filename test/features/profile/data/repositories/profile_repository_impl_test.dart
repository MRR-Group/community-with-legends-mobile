import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/profile/data/data_sources/profile_datasource.dart';
import 'package:community_with_legends_mobile/src/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:community_with_legends_mobile/src/shared/data/data_sources/local/local_user_data_source_impl.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_repository_impl_test.mocks.dart';

@GenerateMocks([ProfileDatasource, LocalUserDataSourceImpl])
void main() {
  late ProfileRepositoryImpl repository;
  late MockProfileDatasource mockProfileDatasource;
  late MockLocalUserDataSourceImpl mockLocalUserDataSource;

  final mockUserJson = {
    'id': 1,
    'name': 'Test User',
    'email': 'test@example.com',
    'avatar': '',
    'isBanned': false,
    'hasPassword': true,
    'hasTwitchAccount': false,
    'email_verified_at': '2024-01-01T00:00:00.000Z',
    'created_at': '2023-01-01T00:00:00.000Z',
    'permissions': [],
  };

  setUp(() {
    mockProfileDatasource = MockProfileDatasource();
    mockLocalUserDataSource = MockLocalUserDataSourceImpl();
    repository = ProfileRepositoryImpl(mockProfileDatasource, mockLocalUserDataSource);
  });

  test('getUserProfile returns a User from API', () async {
    when(mockProfileDatasource.getUserProfile(1))
        .thenAnswer((_) async => {'data': mockUserJson});

    final user = await repository.getUserProfile(1);

    expect(user.name, 'Test User');
    verify(mockProfileDatasource.getUserProfile(1)).called(1);
  });

  test('getCurrentUserProfile returns user and caches on success', () async {
    when(mockProfileDatasource.getCurrentUserProfile())
        .thenAnswer((_) async => {'data': mockUserJson});

    final user = await repository.getCurrentUserProfile();

    expect(user.email, 'test@example.com');
    verify(mockProfileDatasource.getCurrentUserProfile()).called(1);
    verify(mockLocalUserDataSource.cacheUser(any)).called(1);
  });

  test('getCurrentUserProfile returns local user on NoInternetException', () async {
    final localUser = User.fromJson(mockUserJson);

    when(mockProfileDatasource.getCurrentUserProfile())
        .thenThrow(NoInternetException());
    when(mockLocalUserDataSource.getCurrentUser())
        .thenAnswer((_) async => localUser);

    final user = await repository.getCurrentUserProfile();

    expect(user.name, 'Test User');
    verify(mockLocalUserDataSource.getCurrentUser()).called(1);
  });

  test('changeUserNickname calls datasource', () async {
    when(mockProfileDatasource.changeUserNickname('NewName'))
        .thenAnswer((_) async => <String, dynamic>{});

    await repository.changeUserNickname('NewName');

    verify(mockProfileDatasource.changeUserNickname('NewName')).called(1);
  });
}
