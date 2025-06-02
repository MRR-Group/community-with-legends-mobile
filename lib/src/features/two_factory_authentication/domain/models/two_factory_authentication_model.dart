class TwoFactoryAuthentication {
  final String code;
  final DateTime expiresAt;

  TwoFactoryAuthentication({
    required this.code,
    required this.expiresAt,
  });


  factory TwoFactoryAuthentication.fromJson(Map<String, dynamic> json) {
    return TwoFactoryAuthentication(
      code: json['token'],
      expiresAt: DateTime.parse(json['expires_at']).toLocal(),
    );
  }
}
