import 'package:community_with_legends_mobile/src/features/app_update/domain/repositories/update_repository.dart';

class CheckUpdateUsecase {
  final UpdateRepository updateRepository;

  CheckUpdateUsecase(this.updateRepository);

  Future<void> execute() async {
    return await updateRepository.checkForUpdate();
  }

}
