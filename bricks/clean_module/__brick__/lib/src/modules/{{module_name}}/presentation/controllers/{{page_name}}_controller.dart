import 'package:flutter/foundation.dart';

import '../../domain/usecases/get_{{module_name}}_usecase.dart';
import '../states/{{page_name}}_state.dart';

class {{page_name.pascalCase()}}Controller extends ValueNotifier<{{page_name.pascalCase()}}State> {
  final IGet{{module_name.pascalCase()}}Usecase _usecase;

  {{page_name.pascalCase()}}Controller(this._usecase) : super(const {{page_name.pascalCase()}}Initial());

  void reset() {
    value = const {{page_name.pascalCase()}}Initial();
  }
}
