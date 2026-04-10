import '../../infrastructure/datasources/{{module_name}}_datasource.dart';
import '../../infrastructure/models/{{module_name}}_model.dart';

class {{module_name.pascalCase()}}DatasourceImpl implements I{{module_name.pascalCase()}}Datasource {
  {{module_name.pascalCase()}}DatasourceImpl();

  @override
  Future<{{module_name.pascalCase()}}Model> get{{module_name.pascalCase()}}(String id) async {
    // TODO: implement data fetching (e.g., from API or Database)
    return {{module_name.pascalCase()}}Model(id: id);
  }
}
