import '../../domain/contracts/admin_repository.dart';
import '../../domain/entities/admin_entity.dart';
import '../datasources/admin_datasource.dart';

class AdminRepositoryImpl implements IAdminRepository {
  final IAdminDatasource datasource;

  AdminRepositoryImpl(this.datasource);

  @override
  Future<AdminEntity> getAdmin(String id) async {
    return await datasource.getAdmin(id);
  }
}
