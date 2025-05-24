import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

abstract class SearchUsersRepository{
  Future<List<User>> searchUsersByName(String filter);
}
