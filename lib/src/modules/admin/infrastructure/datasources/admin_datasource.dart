import '../models/admin_model.dart';

abstract class IAdminDatasource {
  Future<AdminModel> getAdmin(String id);
}
