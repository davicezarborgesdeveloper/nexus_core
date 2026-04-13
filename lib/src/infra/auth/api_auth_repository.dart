import 'package:login_module/login_module.dart';
import 'firebase_auth_repository.dart';

class ApiAuthRepository implements AuthRepository {
  ApiAuthRepository({AuthRepository? delegate})
      : _delegate = delegate ?? FirebaseAuthRepository();

  final AuthRepository _delegate;

  @override
  Future<Result<AuthSession, AuthFailure>> signIn({
    required String email,
    required String password,
    bool rememberMe = false,
  }) => _delegate.signIn(email: email, password: password, rememberMe: rememberMe);
}
