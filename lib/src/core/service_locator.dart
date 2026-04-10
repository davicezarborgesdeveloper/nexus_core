import 'package:get_it/get_it.dart';
import 'package:login_module/login_module.dart';
import 'package:nexus_core/src/infra/auth/firebase_auth_repository.dart';
import 'package:nexus_core/src/infra/auth/shared_prefs_session_storage.dart';
import 'package:nexus_core/src/modules/dashboard/dashboard_module.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Infrastructure
  getIt.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository());
  getIt.registerLazySingleton<SessionStorage>(() => SharedPrefsSessionStorage());

  // Modules
  getIt.registerLazySingleton<LoginModule>(
    () => LoginModule(
      repository: getIt<AuthRepository>(),
      sessionStorage: getIt<SessionStorage>(),
    ),
  );
  getIt.registerLazySingleton<DashboardModule>(() => DashboardModule());
}
