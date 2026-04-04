import '../contracts/auth_repository.dart';
import '../entities/auth_session.dart';
import '../result.dart';

class SignIn {
  final AuthRepository repository;

  const SignIn(this.repository);

  Future<Result<AuthSession>> call({
    required String email,
    required String password,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();

    if (normalizedEmail.isEmpty) {
      return const Failure('Informe o e-mail');
    }

    if (!_isValidEmail(normalizedEmail)) {
      return const Failure('Informe um e-mail válido');
    }

    if (password.isEmpty) {
      return const Failure('Informe a senha');
    }

    return repository.signIn(email: normalizedEmail, password: password);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
  }
}
