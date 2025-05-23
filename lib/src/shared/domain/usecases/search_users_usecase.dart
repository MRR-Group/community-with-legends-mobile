import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/repositories/search_users_repository.dart';

class SearchUsersUsecase{
  SearchUsersRepository searchUsersRepository;

  SearchUsersUsecase(this.searchUsersRepository);

  Future<List<User>> execute(String filter) async {
    return searchUsersRepository.searchUsersByName(filter);
  }
}
