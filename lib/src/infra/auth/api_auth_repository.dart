import 'package:login_module/login_module.dart';

class ApiAuthRepository implements AuthRepository {
  @override
  Future<Result<AuthSession>> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'admin@teste.com' && password == '123456') {
      return const Success(
        AuthSession(
          accessToken: 'token_abc_123',
          userId: '1',
          refreshToken: 'refresh_xyz_456',
        ),
      );
    }

    return const Failure('Usuário ou senha inválidos');
  }
}
