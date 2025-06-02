import 'package:community_with_legends_mobile/src/features/two_factory_authentication/data/data_sources/two_factory_authentication_datasource.dart';
import 'package:community_with_legends_mobile/src/features/two_factory_authentication/domain/models/two_factory_authentication_model.dart';
import 'package:community_with_legends_mobile/src/features/two_factory_authentication/domain/repositories/two_factory_authentication_repository.dart';

class TwoFactoryAuthenticationRepositoryImpl
    extends TwoFactoryAuthenticationRepository {
  TwoFactoryAuthenticationDatasource remoteDatasource;

  TwoFactoryAuthenticationRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<TwoFactoryAuthentication> getTfaCode() async {
    final result = await remoteDatasource.getTfaCode();

    return TwoFactoryAuthentication.fromJson(result);
  }
}
