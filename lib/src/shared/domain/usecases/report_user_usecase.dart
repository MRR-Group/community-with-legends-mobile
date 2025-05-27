import 'package:community_with_legends_mobile/src/shared/domain/repositories/user_repository.dart';

class ReportUserUsecase {
  UserRepository userRepository;

  ReportUserUsecase(this.userRepository);

  Future<void> execute(int userId) async {
    await userRepository.reportUser(userId);
  }
}
