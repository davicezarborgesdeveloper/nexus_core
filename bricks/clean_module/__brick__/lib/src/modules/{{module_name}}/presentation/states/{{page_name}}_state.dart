sealed class {{page_name.pascalCase()}}State {
  const {{page_name.pascalCase()}}State();
}

class {{page_name.pascalCase()}}Initial extends {{page_name.pascalCase()}}State {
  const {{page_name.pascalCase()}}Initial();
}

class {{page_name.pascalCase()}}Loading extends {{page_name.pascalCase()}}State {
  const {{page_name.pascalCase()}}Loading();
}

class {{page_name.pascalCase()}}Success extends {{page_name.pascalCase()}}State {
  const {{page_name.pascalCase()}}Success();
}

class {{page_name.pascalCase()}}Error extends {{page_name.pascalCase()}}State {
  final String message;

  const {{page_name.pascalCase()}}Error(this.message);
}
