import '../contracts/auth_repository.dart';
import '../entities/auth_session.dart';
import '../errors/auth_failure.dart';
import '../result.dart';

class SignIn {
  final AuthRepository repository;

  const SignIn(this.repository);

  Future<Result<AuthSession, AuthFailure>> call({
    required String email,
    required String password,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();

    if (normalizedEmail.isEmpty) {
      return const Failure(ValidationFailure('Informe o e-mail'));
    }

    if (!_isValidEmail(normalizedEmail)) {
      return const Failure(ValidationFailure('Informe um e-mail válido'));
    }

    if (password.isEmpty) {
      return const Failure(ValidationFailure('Informe a senha'));
    }

    return repository.signIn(email: normalizedEmail, password: password);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);
  }
}
