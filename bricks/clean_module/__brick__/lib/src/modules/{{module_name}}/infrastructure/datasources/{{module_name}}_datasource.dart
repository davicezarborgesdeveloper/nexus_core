import '../models/{{module_name}}_model.dart';

abstract class I{{module_name.pascalCase()}}Datasource {
  Future<{{module_name.pascalCase()}}Model> get{{module_name.pascalCase()}}(String id);
}
