import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';

abstract class UserRepository{
  Future<User> getUserById(int id);
}
