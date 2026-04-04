import '../entities/auth_session.dart';
import '../result.dart';

abstract class AuthRepository {
  Future<Result<AuthSession>> signIn({
    required String email,
    required String password,
  });
}
