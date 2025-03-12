import 'package:community_with_legends_mobile/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import '../data_sources/auth_api.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthApi api;

  AuthRepositoryImpl(this.api);

  @override
  Future<String> login(String email, String password) async {
    final response = await api.login(email, password);
    if(response.containsKey('token')){
      return response['token'];
    }else{
      throw ErrorDescription(response['message'] ?? 'Login failed');
    }
  }
}