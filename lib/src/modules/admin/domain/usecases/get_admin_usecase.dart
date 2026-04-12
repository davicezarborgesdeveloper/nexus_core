import '../contracts/admin_repository.dart';
import '../entities/admin_entity.dart';

abstract class IGetAdminUsecase {
  Future<AdminEntity> call(String id);
}

class GetAdminUsecase implements IGetAdminUsecase {
  final IAdminRepository repository;

  GetAdminUsecase(this.repository);

  @override
  Future<AdminEntity> call(String id) async {
    return await repository.getAdmin(id);
  }
}
