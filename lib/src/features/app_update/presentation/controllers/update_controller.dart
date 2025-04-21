import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_info_model.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/usecases/check_update_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpdateController extends ChangeNotifier {
  final CheckUpdateUsecase checkUpdateUsecase;

  UpdateController(this.checkUpdateUsecase);

  Future<VersionInfo?> updateAvailable() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    final latestVersion = await checkUpdateUsecase.execute();

    if (_isNewerVersion(remote: latestVersion.name, local: currentVersion)) {
      return latestVersion;
    }

    return null;
  }

  bool _isNewerVersion({required String remote, required String local}) {
    String normalize(String version) => version.replaceFirst('v', '');
    List<int> parse(String version) =>
        normalize(version).split('.').map(int.parse).toList();

    final remoteParts = parse(remote);
    final localParts = parse(local);

    for (int i = 0; i < remoteParts.length; i++) {
      if (remoteParts[i] > localParts[i]) {
        return true;
      }
      if (remoteParts[i] < localParts[i]) {
        return false;
      }
    }

    return false;
  }
}
