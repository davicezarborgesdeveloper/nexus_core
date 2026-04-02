import '../entities/auth_session.dart';

abstract class SessionStorage {
  Future<void> save(AuthSession session);
  Future<AuthSession?> read();
  Future<void> clear();
}
