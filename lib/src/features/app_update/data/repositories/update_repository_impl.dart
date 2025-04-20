import 'package:community_with_legends_mobile/src/features/app_update/data/data_sources/update_datasource.dart';
import 'package:community_with_legends_mobile/src/features/app_update/domain/repositories/update_repository.dart';

class UpdateRepositoryImpl extends UpdateRepository {
  final UpdateDatasource updateDatasource;

  UpdateRepositoryImpl(this.updateDatasource);

  @override
  Future<void> checkForUpdate() async {
    try{
      final latestVersion = updateDatasource.getLatestVersion();
    }catch (e){
      print('Unexpected error $e');
    }
  }
}
