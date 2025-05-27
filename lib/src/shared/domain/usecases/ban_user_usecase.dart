import 'package:community_with_legends_mobile/src/shared/domain/repositories/user_repository.dart';

class BanUserUsecase {
  UserRepository userRepository;

  BanUserUsecase(this.userRepository);

  Future<void> execute(int userId)async {
    await userRepository.banUser(userId);
  }
}
