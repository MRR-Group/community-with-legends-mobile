import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_info_model.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/usecases/check_update_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpdateController extends ChangeNotifier{
  final CheckUpdateUsecase checkUpdateUsecase;

  UpdateController(this.checkUpdateUsecase);

  Future<VersionInfo?> updateAvailable() async{
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = 'v${packageInfo.version}';
    final latestVersion = await checkUpdateUsecase.execute();

    if(_isNewer(remote: latestVersion.name, local: currentVersion)){
      return latestVersion;
    }

    return null;
  }

  bool _isNewer({required String remote, required String local}){
    return remote.compareTo(local) > 0;
  }
}
