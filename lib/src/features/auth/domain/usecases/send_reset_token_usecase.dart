import 'package:community_with_legends_mobile/src/features/auth/domain/repositories/auth_repository.dart';

class SendResetTokenUsecase {
  final AuthRepository repository;

  SendResetTokenUsecase(this.repository);

  Future<void> execute(String email) async {
    repository.sendResetToken(email);
  }
}
