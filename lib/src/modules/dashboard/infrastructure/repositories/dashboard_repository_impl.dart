import '../../domain/contracts/dashboard_repository.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../datasources/dashboard_datasource.dart';

class DashboardRepositoryImpl implements IDashboardRepository {
  final IDashboardDatasource datasource;

  DashboardRepositoryImpl(this.datasource);

  @override
  Future<DashboardEntity> getDashboard(String id) async {
    return await datasource.getDashboard(id);
  }
}
