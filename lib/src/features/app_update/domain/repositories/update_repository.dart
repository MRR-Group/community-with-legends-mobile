import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_info_model.dart';

abstract class UpdateRepository {
  Future<VersionInfo> checkForUpdate();
}
