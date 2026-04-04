import 'domain/contracts/auth_repository.dart';
import 'domain/contracts/session_storage.dart';
import 'domain/usecases/sign_in.dart';
import 'presentation/controllers/login_controller.dart';
import 'presentation/pages/login_page.dart';

class LoginModule {
  final AuthRepository repository;
  final SessionStorage? sessionStorage;

  const LoginModule({required this.repository, this.sessionStorage});

  LoginController createController() {
    return LoginController(
      signInUseCase: SignIn(repository),
      sessionStorage: sessionStorage,
    );
  }

  LoginPage createPage({void Function()? onSuccess, String title = 'Login'}) {
    return LoginPage(
      controller: createController(),
      onSuccess: onSuccess,
      title: title,
    );
  }
}
