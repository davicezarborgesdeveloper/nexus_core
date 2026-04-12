import 'domain/usecases/get_{{module_name}}_usecase.dart';
import 'external/datasources/{{module_name}}_datasource_impl.dart';
import 'infrastructure/repositories/{{module_name}}_repository_impl.dart';
import 'presentation/controllers/{{page_name}}_controller.dart';
import 'presentation/pages/{{page_name}}_page.dart';

class {{module_name.pascalCase()}}Module {
  {{module_name.pascalCase()}}Module();

  {{page_name.pascalCase()}}Page createPage({
    String title = '{{page_name.pascalCase()}}',
  }) {
    final datasource = {{module_name.pascalCase()}}DatasourceImpl();
    final repository = {{module_name.pascalCase()}}RepositoryImpl(datasource);
    final usecase = Get{{module_name.pascalCase()}}Usecase(repository);
    final controller = {{page_name.pascalCase()}}Controller(usecase);

    return {{page_name.pascalCase()}}Page(
      controller: controller,
      title: title,
    );
  }
}
