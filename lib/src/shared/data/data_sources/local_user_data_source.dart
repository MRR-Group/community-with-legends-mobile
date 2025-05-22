class LocalUserDataSource {

  Future<Map<String, dynamic>> getUserById(int id){
    return getRequest(urlPath: '/api/users/$id');
  }
}
