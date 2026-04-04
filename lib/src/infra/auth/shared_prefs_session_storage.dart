import 'package:login_module/login_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsSessionStorage implements SessionStorage {
  static const _keyAccessToken = 'session_access_token';
  static const _keyUserId = 'session_user_id';
  static const _keyRefreshToken = 'session_refresh_token';

  @override
  Future<void> save(AuthSession session) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAccessToken, session.accessToken);
    await prefs.setString(_keyUserId, session.userId);
    if (session.refreshToken != null) {
      await prefs.setString(_keyRefreshToken, session.refreshToken!);
    }
  }

  @override
  Future<AuthSession?> read() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(_keyAccessToken);
    final userId = prefs.getString(_keyUserId);

    if (accessToken == null || userId == null) return null;

    return AuthSession(
      accessToken: accessToken,
      userId: userId,
      refreshToken: prefs.getString(_keyRefreshToken),
    );
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAccessToken);
    await prefs.remove(_keyUserId);
    await prefs.remove(_keyRefreshToken);
  }
}
