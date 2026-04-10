import 'package:flutter/foundation.dart';
import '../states/{{module_name}}_state.dart';

class {{module_name.pascalCase()}}Controller extends ValueNotifier<{{module_name.pascalCase()}}State> {
  {{module_name.pascalCase()}}Controller() : super(const {{module_name.pascalCase()}}Initial());

  void reset() {
    value = const {{module_name.pascalCase()}}Initial();
  }
}
