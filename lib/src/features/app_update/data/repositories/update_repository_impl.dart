import 'package:community_with_legends_mobile/src/core/errors/exceptions/check_update_exception.dart';
import 'package:community_with_legends_mobile/src/features/app_update/data/data_sources/update_datasource.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_asset_model.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_info_model.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/repositories/update_repository.dart';

class UpdateRepositoryImpl extends UpdateRepository {
  final UpdateDatasource updateDatasource;

  UpdateRepositoryImpl(this.updateDatasource);

  @override
  Future<VersionInfo> checkForUpdate() async {
    final response = await updateDatasource.getLatestVersion();
    return VersionInfo(
      name: response.name,
      publishedAt: response.publishedAt,
      downloadUrl: getDownloadUrl(response.versionAssets),
      description: response.description,
    );
  }

  String getDownloadUrl(List<VersionAsset> assets) {
    for (final asset in assets) {
      if (asset.name.contains('.apk')) {
        return asset.downloadUrl;
      }
    }
    return '';
  }
}
