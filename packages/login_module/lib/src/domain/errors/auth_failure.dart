sealed class AuthFailure {
  const AuthFailure();

  String get message;
}

class InvalidCredentials extends AuthFailure {
  const InvalidCredentials();

  @override
  String get message => 'Usuário ou senha inválidos';
}

class NetworkFailure extends AuthFailure {
  final String? details;

  const NetworkFailure([this.details]);

  @override
  String get message =>
      details != null ? 'Falha de conexão: $details' : 'Falha de conexão';
}

class ValidationFailure extends AuthFailure {
  final String _message;

  const ValidationFailure(this._message);

  @override
  String get message => _message;
}
