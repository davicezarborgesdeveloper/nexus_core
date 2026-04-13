import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/foundation.dart';
import 'package:login_module/login_module.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({fb.FirebaseAuth? firebaseAuth})
      : _auth = firebaseAuth ?? fb.FirebaseAuth.instance;

  final fb.FirebaseAuth _auth;

  @override
  Future<Result<AuthSession, AuthFailure>> signIn({
    required String email,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      if (kIsWeb) {
        await _auth.setPersistence(
          rememberMe ? fb.Persistence.LOCAL : fb.Persistence.SESSION,
        );
      }

      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;
      final accessToken = await user.getIdToken() ?? '';

      return Success(
        AuthSession(
          accessToken: accessToken,
          userId: user.uid,
          refreshToken: user.refreshToken,
        ),
      );
    } on fb.FirebaseAuthException catch (e) {
      return Failure(_mapFirebaseError(e.code));
    } catch (_) {
      return const Failure(NetworkFailure());
    }
  }

  AuthFailure _mapFirebaseError(String code) {
    return switch (code) {
      'user-not-found' || 'wrong-password' || 'invalid-credential' =>
        const InvalidCredentials(),
      'invalid-email' => const ValidationFailure('E-mail inválido'),
      'weak-password' => const ValidationFailure('Senha muito fraca'),
      'network-request-failed' => const NetworkFailure(),
      _ => NetworkFailure(code),
    };
  }
}
