import 'package:nexus_core/src/modules/admin/presentation/pages/admin_shell_page.dart';

import 'domain/usecases/get_admin_usecase.dart';
import 'external/datasources/admin_datasource_impl.dart';
import 'infrastructure/repositories/admin_repository_impl.dart';

class AdminModule {
  AdminModule();

  AdminShellPage createPage() {
    final datasource = AdminDatasourceImpl();
    final repository = AdminRepositoryImpl(datasource);
    final usecase = GetAdminUsecase(repository);

    return AdminShellPage(usecase: usecase);
  }
}
