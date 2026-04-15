# Clean Module Brick

Um gerador de código baseado no [Mason](https://pub.dev/packages/mason_cli) para o projeto Nexus Core, utilizado para criar rapidamente toda a estrutura inicial para um novo módulo seguindo o padrão do **Clean Architecture**.

## O que este Brick gera?

```text
lib/src/modules/<module_name>/
├── domain/
│   ├── contracts/
│   │   └── <module_name>_repository.dart
│   ├── entities/
│   │   └── <module_name>_entity.dart
│   └── usecases/
│       └── get_<module_name>_usecase.dart
├── infrastructure/
│   ├── datasources/
│   │   └── <module_name>_datasource.dart
│   ├── models/
│   │   └── <module_name>_model.dart
│   └── repositories/
│       └── <module_name>_repository_impl.dart
├── external/
│   └── datasources/
│       └── <module_name>_datasource_impl.dart
├── presentation/
│   └── pages/
│       └── <module_name>/
│           ├── <module_name>_state.dart
│           ├── <module_name>_controller.dart
│           └── <module_name>_page.dart
└── <module_name>_module.dart
```

Todas as referências a `module_name` são convertidas para `PascalCase` nas classes e `snake_case` nos nomes de arquivo.

## Instalação (Pré-requisitos)

Certifique-se de que o **Mason** esteja instalado:

```bash
dart pub global activate mason_cli
```

Na raiz do projeto, baixe os templates:

```bash
mason get
```

## Como utilizar

```bash
mason make clean_module
```

Ou passando a variável diretamente:

```bash
mason make clean_module --module_name "user_profile"
```

> **Dica**: Use sempre _snake_case_ no nome do módulo (ex: `dashboard`, `user_profile`). O Mason cuida da capitalização nas classes.

## Customização

Para alterar o _boilerplate_ gerado, edite os templates em `bricks/clean_module/__brick__/`.
