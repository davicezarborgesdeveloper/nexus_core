import '../../domain/errors/auth_failure.dart';

sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  const LoginSuccess();
}

class LoginError extends LoginState {
  final AuthFailure error;

  const LoginError(this.error);
}

class LoggedOut extends LoginState {
  const LoggedOut();
}
