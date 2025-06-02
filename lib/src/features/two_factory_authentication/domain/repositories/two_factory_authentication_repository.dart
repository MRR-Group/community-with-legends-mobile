import 'package:community_with_legends_mobile/src/features/two_factory_authentication/domain/models/two_factory_authentication_model.dart';

abstract class TwoFactoryAuthenticationRepository {
  Future<TwoFactoryAuthentication> getTfaCode();
}
