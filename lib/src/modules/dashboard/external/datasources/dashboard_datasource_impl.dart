import '../../infrastructure/datasources/dashboard_datasource.dart';
import '../../infrastructure/models/dashboard_model.dart';

class DashboardDatasourceImpl implements IDashboardDatasource {
  DashboardDatasourceImpl();

  @override
  Future<DashboardModel> getDashboard(String id) async {
    // TODO: implement data fetching (e.g., from API or Database)
    return DashboardModel(id: id);
  }
}
