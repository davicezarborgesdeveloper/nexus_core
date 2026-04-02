import 'package:flutter/foundation.dart';

import '../../domain/contracts/session_storage.dart';
import '../../domain/result.dart';
import '../../domain/usecases/sign_in.dart';
import '../states/login_state.dart';

class LoginController extends ValueNotifier<LoginState> {
  final SignIn signInUseCase;
  final SessionStorage? sessionStorage;

  LoginController({
    required this.signInUseCase,
    this.sessionStorage,
  }) : super(const LoginInitial());

  Future<void> submit({
    required String email,
    required String password,
  }) async {
    value = const LoginLoading();

    final result = await signInUseCase(email: email, password: password);

    switch (result) {
      case Success(:final data):
        await sessionStorage?.save(data);
        value = const LoginSuccess();
      case Failure(:final message):
        value = LoginError(message);
    }
  }

  void reset() {
    value = const LoginInitial();
  }
}
