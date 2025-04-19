class UnauthenticatedException implements Exception {
  @override
  String toString() => 'Authentication failed. Please sign in to continue.';
}
