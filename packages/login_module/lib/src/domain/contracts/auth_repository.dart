import '../entities/auth_session.dart';
import '../errors/auth_failure.dart';
import '../result.dart';

abstract class AuthRepository {
  Future<Result<AuthSession, AuthFailure>> signIn({
    required String email,
    required String password,
  });
}
