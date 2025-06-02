import 'package:community_with_legends_mobile/src/core/errors/exceptions/http_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/message_exception.dart';
import 'package:community_with_legends_mobile/src/core/errors/exceptions/no_internet_exception.dart';
import 'package:community_with_legends_mobile/src/features/two_factory_authentication/domain/models/two_factory_authentication_model.dart';
import 'package:community_with_legends_mobile/src/features/two_factory_authentication/domain/usecases/get_tfa_code_usecase.dart';
import 'package:flutter/cupertino.dart';

class TFAuthenticationController extends ChangeNotifier {
  GetTfaCodeUsecase getTfaCodeUsecase;

  TFAuthenticationController({
    required this.getTfaCodeUsecase,
  });

  Future<TwoFactoryAuthentication> generateTfaCode() async {
    try {
      return getTfaCodeUsecase.execute();
    } on HttpException catch (error) {
      throw MessageException(error.message);
    } on NoInternetException catch (error) {
      throw MessageException(error.toString());
    }
  }
}
