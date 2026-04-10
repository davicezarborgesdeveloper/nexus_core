import '../models/dashboard_model.dart';

abstract class IDashboardDatasource {
  Future<DashboardModel> getDashboard(String id);
}
