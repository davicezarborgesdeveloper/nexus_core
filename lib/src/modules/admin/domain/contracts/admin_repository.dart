import '../entities/admin_entity.dart';

abstract class IAdminRepository {
  Future<AdminEntity> getAdmin(String id);
}
