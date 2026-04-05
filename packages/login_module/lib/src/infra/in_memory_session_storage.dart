import '../domain/contracts/session_storage.dart';
import '../domain/entities/auth_session.dart';

/// Implementação em memória de [SessionStorage].
///
/// Útil para testes e ambientes que não necessitam de persistência real.
/// A sessão é perdida ao encerrar o app.
class InMemorySessionStorage implements SessionStorage {
  AuthSession? _session;

  @override
  Future<void> save(AuthSession session) async {
    _session = session;
  }

  @override
  Future<AuthSession?> read() async {
    return _session;
  }

  @override
  Future<void> clear() async {
    _session = null;
  }
}
