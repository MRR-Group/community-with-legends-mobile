import 'package:community_with_legends_mobile/src/core/data/network/http_client.dart';


class TwoFactoryAuthenticationDatasource extends HttpClient {
  TwoFactoryAuthenticationDatasource({
    required super.baseUrl,
  });

  Future<Map<String, dynamic>> getTfaCode() async {
    return postRequest(
      urlPath: 'api/auth/tfa/generate',
    );
  }
}
