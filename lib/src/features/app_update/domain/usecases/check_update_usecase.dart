import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_info_model.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_response_model.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/repositories/update_repository.dart';

class CheckUpdateUsecase {
  final UpdateRepository updateRepository;

  CheckUpdateUsecase(this.updateRepository);

  Future<VersionInfo> execute() async {
    return updateRepository.checkForUpdate();
  }

}
