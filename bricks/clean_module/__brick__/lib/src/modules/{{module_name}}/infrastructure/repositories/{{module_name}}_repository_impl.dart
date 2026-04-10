import '../../domain/contracts/{{module_name}}_repository.dart';
import '../../domain/entities/{{module_name}}_entity.dart';
import '../datasources/{{module_name}}_datasource.dart';

class {{module_name.pascalCase()}}RepositoryImpl implements I{{module_name.pascalCase()}}Repository {
  final I{{module_name.pascalCase()}}Datasource datasource;

  {{module_name.pascalCase()}}RepositoryImpl(this.datasource);

  @override
  Future<{{module_name.pascalCase()}}Entity> get{{module_name.pascalCase()}}(String id) async {
    return await datasource.get{{module_name.pascalCase()}}(id);
  }
}
