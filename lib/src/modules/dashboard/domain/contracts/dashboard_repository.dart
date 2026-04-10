import '../entities/dashboard_entity.dart';

abstract class IDashboardRepository {
  Future<DashboardEntity> getDashboard(String id);
}
