sealed class {{module_name.pascalCase()}}State {
  const {{module_name.pascalCase()}}State();
}

class {{module_name.pascalCase()}}Initial extends {{module_name.pascalCase()}}State {
  const {{module_name.pascalCase()}}Initial();
}

class {{module_name.pascalCase()}}Loading extends {{module_name.pascalCase()}}State {
  const {{module_name.pascalCase()}}Loading();
}

class {{module_name.pascalCase()}}Success extends {{module_name.pascalCase()}}State {
  const {{module_name.pascalCase()}}Success();
}

class {{module_name.pascalCase()}}Error extends {{module_name.pascalCase()}}State {
  final String message;

  const {{module_name.pascalCase()}}Error(this.message);
}
