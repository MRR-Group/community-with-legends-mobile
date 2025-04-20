import 'package:community_with_legends_mobile/src/features/app_update/data/data_sources/update_datasource.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/models/version_response_model.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/repositories/update_repository.dart';

class UpdateRepositoryImpl extends UpdateRepository {
  final UpdateDatasource updateDatasource;

  UpdateRepositoryImpl(this.updateDatasource);

  @override
  Future<VersionResponse> checkForUpdate() async {
    try{
      return updateDatasource.getLatestVersion();
    }catch (e){
      print('Unexpected error $e');
      rethrow;
    }
  }
}
