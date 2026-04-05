import '../contracts/session_storage.dart';

class SignOut {
  final SessionStorage sessionStorage;

  const SignOut(this.sessionStorage);

  Future<void> call() async {
    await sessionStorage.clear();
  }
}
