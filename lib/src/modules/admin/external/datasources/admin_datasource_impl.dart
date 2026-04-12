import '../../infrastructure/datasources/admin_datasource.dart';
import '../../infrastructure/models/admin_model.dart';

class AdminDatasourceImpl implements IAdminDatasource {
  AdminDatasourceImpl();

  @override
  Future<AdminModel> getAdmin(String id) async {
    // TODO: implement data fetching (e.g., from API or Database)
    return AdminModel(id: id);
  }
}
