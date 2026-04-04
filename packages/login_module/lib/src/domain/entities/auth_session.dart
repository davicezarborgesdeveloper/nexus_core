class AuthSession {
  final String accessToken;
  final String userId;
  final String? refreshToken;

  const AuthSession({
    required this.accessToken,
    required this.userId,
    this.refreshToken,
  });
}
