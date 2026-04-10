import '../contracts/dashboard_repository.dart';
import '../entities/dashboard_entity.dart';

abstract class IGetDashboardUsecase {
  Future<DashboardEntity> call(String id);
}

class GetDashboardUsecase implements IGetDashboardUsecase {
  final IDashboardRepository repository;

  GetDashboardUsecase(this.repository);

  @override
  Future<DashboardEntity> call(String id) async {
    return await repository.getDashboard(id);
  }
}
