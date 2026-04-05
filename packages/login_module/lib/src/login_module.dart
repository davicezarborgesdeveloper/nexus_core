import 'domain/contracts/auth_repository.dart';
import 'domain/contracts/session_storage.dart';
import 'domain/usecases/sign_in.dart';
import 'presentation/controllers/login_controller.dart';
import 'presentation/login_theme.dart';
import 'presentation/pages/login_page.dart';

class LoginModule {
  final AuthRepository repository;
  final SessionStorage? sessionStorage;
  final LoginTheme? theme;

  const LoginModule({
    required this.repository,
    this.sessionStorage,
    this.theme,
  });

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
      loginTheme: theme,
    );
  }
}
