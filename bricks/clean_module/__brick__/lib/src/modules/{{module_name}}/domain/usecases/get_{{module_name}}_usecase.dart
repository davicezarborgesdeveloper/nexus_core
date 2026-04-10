import '../contracts/{{module_name}}_repository.dart';
import '../entities/{{module_name}}_entity.dart';

abstract class IGet{{module_name.pascalCase()}}Usecase {
  Future<{{module_name.pascalCase()}}Entity> call(String id);
}

class Get{{module_name.pascalCase()}}Usecase implements IGet{{module_name.pascalCase()}}Usecase {
  final I{{module_name.pascalCase()}}Repository repository;

  Get{{module_name.pascalCase()}}Usecase(this.repository);

  @override
  Future<{{module_name.pascalCase()}}Entity> call(String id) async {
    return await repository.get{{module_name.pascalCase()}}(id);
  }
}
