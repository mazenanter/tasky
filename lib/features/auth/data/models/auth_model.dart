class AuthModel {
  final dynamic id;
  final dynamic displayName;
  final dynamic accessToken;
  final dynamic refreshToken;

  AuthModel(
      {required this.id,
      required this.displayName,
      required this.accessToken,
      required this.refreshToken});
  factory AuthModel.fromJson(json) {
    return AuthModel(
      id: json['_id'],
      displayName: json['displayName'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
