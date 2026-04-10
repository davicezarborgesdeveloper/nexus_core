import 'presentation/controllers/{{module_name}}_controller.dart';
import 'presentation/pages/{{module_name}}_page.dart';

class {{module_name.pascalCase()}}Module {
  {{module_name.pascalCase()}}Module();

  {{module_name.pascalCase()}}Controller createController() {
    return {{module_name.pascalCase()}}Controller();
  }

  {{module_name.pascalCase()}}Page createPage({
    String title = '{{module_name.pascalCase()}}',
  }) {
    return {{module_name.pascalCase()}}Page(
      controller: createController(),
      title: title,
    );
  }
}
