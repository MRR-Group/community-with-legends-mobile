import 'package:community_with_legends_mobile/src/shared/domain/models/user_model.dart';
import 'package:community_with_legends_mobile/src/shared/domain/repositories/user_repository.dart';

class GetCurrentUserUsecase{
  UserRepository userRepository;

  GetCurrentUserUsecase(this.userRepository);

  Future<User> execute() async {
    return userRepository.getCurrentUser();
  }
}
