import 'domain/usecases/get_admin_usecase.dart';
import 'external/datasources/admin_datasource_impl.dart';
import 'infrastructure/repositories/admin_repository_impl.dart';
import 'presentation/controllers/perfil_controller.dart';
import 'presentation/pages/perfil_page.dart';

class AdminModule {
  AdminModule();

  PerfilPage createPage({
    String title = 'Perfil',
  }) {
    final datasource = AdminDatasourceImpl();
    final repository = AdminRepositoryImpl(datasource);
    final usecase = GetAdminUsecase(repository);
    final controller = PerfilController(usecase);

    return PerfilPage(
      controller: controller,
      title: title,
    );
  }
}
