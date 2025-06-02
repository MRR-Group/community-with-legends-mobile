import 'package:community_with_legends_mobile/src/features/two_factory_authentication/domain/models/two_factory_authentication_model.dart';
import 'package:community_with_legends_mobile/src/features/two_factory_authentication/domain/repositories/two_factory_authentication_repository.dart';

class GetTfaCodeUsecase {
  TwoFactoryAuthenticationRepository repository;

  GetTfaCodeUsecase(this.repository);

  Future<TwoFactoryAuthentication> execute() {
    return repository.getTfaCode();
  }
}
