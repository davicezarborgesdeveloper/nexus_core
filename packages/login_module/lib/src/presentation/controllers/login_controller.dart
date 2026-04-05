import 'package:flutter/foundation.dart';

import '../../domain/contracts/session_storage.dart';
import '../../domain/result.dart';
import '../../domain/usecases/sign_in.dart';
import '../../domain/usecases/sign_out.dart';
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
    bool rememberMe = false,
  }) async {
    value = const LoginLoading();

    final result = await signInUseCase(email: email, password: password);

    switch (result) {
      case Success(:final data):
        if (rememberMe && sessionStorage != null) {
          await sessionStorage!.save(data);
        }
        value = const LoginSuccess();
      case Failure(:final error):
        value = LoginError(error);
    }
  }

  Future<void> logout() async {
    if (sessionStorage != null) {
      await SignOut(sessionStorage!).call();
    }
    value = const LoggedOut();
  }

  void reset() {
    value = const LoginInitial();
  }
}
