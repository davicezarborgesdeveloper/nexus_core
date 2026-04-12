import 'package:flutter/foundation.dart';
import '../states/{{page_name}}_state.dart';

class {{page_name.pascalCase()}}Controller extends ValueNotifier<{{page_name.pascalCase()}}State> {
  {{page_name.pascalCase()}}Controller() : super(const {{page_name.pascalCase()}}Initial());

  void reset() {
    value = const {{page_name.pascalCase()}}Initial();
  }
}
