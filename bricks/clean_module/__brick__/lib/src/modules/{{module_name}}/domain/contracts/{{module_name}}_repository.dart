import '../entities/{{module_name}}_entity.dart';

abstract class I{{module_name.pascalCase()}}Repository {
  Future<{{module_name.pascalCase()}}Entity> get{{module_name.pascalCase()}}(String id);
}
