# Clean Module Brick

Um gerador de código baseado no [Mason](https://pub.dev/packages/mason_cli) para o projeto Nexus Core, utilizado para criar rapidamente toda a estrutura inicial para um novo módulo seguindo o padrão do **Clean Architecture**.

## O que este Brick gera?

Quando você utiliza este brick, ele automaticamente cria as seguintes pastas e arquivos com as nomenclaturas já configuradas:

```text
lib/src/modules/{{module_name}}/
├── domain/
│   ├── contracts/
│   ├── entities/
│   └── usecases/
├── presentation/
│   ├── controllers/
│   │   └── {{module_name}}_controller.dart
│   ├── pages/
│   │   └── {{module_name}}_page.dart
│   └── states/
│       └── {{module_name}}_state.dart
└── {{module_name}}_module.dart
```

Todas as referências a `module_name` serão convertidas para CamelCase (ex: `MyModuleController`) para as classes, e _snake_case_ (`my_module_controller.dart`) para os nomes de arquivo.

## Instalação (Pré-requisitos)

Certifique-se de que o **Mason** esteja instalado no seu ambiente global do Dart:
```bash
dart pub global activate mason_cli
```

Após ativá-lo, baixe os templates que estão referenciados no arquivo `mason.yaml` rodando (na raiz do projeto):
```bash
mason get
```

## Como utilizar

Abra o seu terminal na **raiz do projeto** (`nexus_core`) e execute o comando abaixo para criar um novo módulo:

```bash
mason make clean_module
```

O próprio Mason irá perguntar qual deve ser o nome do novo módulo.

### Utilizando variáveis na linha de comando
Se você desejar criar o módulo de forma mais ágil, sem os prompts de perguntas do Mason, passe a variável direto na execução:

```bash
mason make clean_module --module_name "user_profile"
```

> **Dica**: Sempre prefira usar nomes no formato _snake_case_ na hora de digitar o nome da sua feature (ex: `dashboard`, `user_profile`, `configuration_tools`). O Mason cuidará das letras maiúsculas e minúsculas no lugar certo!

## Customização

Se quiser trocar a forma como o código _boilerplate_ é gerado pelo seu próprio estilo num futuro, basta acessar a pasta `bricks/clean_module/__brick__/` e fazer alterações nos templates presentes!
