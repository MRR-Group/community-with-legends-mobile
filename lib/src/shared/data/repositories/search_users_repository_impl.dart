import 'package:community_with_legends_mobile/src/shared/data/data_sources/remote/remote_search_users_data_source.dart';
import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/repositories/search_users_repository.dart';

class SearchUsersRepositoryImpl extends SearchUsersRepository{
  SearchUsersDataSource searchUsersDataSource;
  SearchUsersRepositoryImpl(this.searchUsersDataSource);

  @override
  Future<List<User>> searchUsersByName(String filter) async {
    final response = await searchUsersDataSource.searchUsersByName(filter);

    final result = (response['data'] as List<dynamic>)
        .map((users) => User.fromJson(users))
        .toList();

    return result;
  }

}
