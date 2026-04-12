# clean_page

Adiciona uma page com controller e state independentes a um módulo existente.

## Uso

```bash
mason make clean_page --module_name auth --page_name login
```

Ou de forma interativa:

```bash
mason make clean_page
```

## Variáveis

| Variável      | Descrição                         | Exemplo        |
|---------------|-----------------------------------|----------------|
| `module_name` | Nome do módulo já existente       | `auth`         |
| `page_name`   | Nome da page a ser criada         | `login`        |

## Arquivos gerados

```
lib/src/modules/<module_name>/presentation/
├── controllers/
│   └── <page_name>_controller.dart
├── pages/
│   └── <page_name>_page.dart
└── states/
    └── <page_name>_state.dart
```

## Exemplo real

```bash
mason make clean_page --module_name auth --page_name login
mason make clean_page --module_name auth --page_name register
mason make clean_page --module_name auth --page_name forgot_password
```

Resultado:

```
lib/src/modules/auth/presentation/
├── controllers/
│   ├── login_controller.dart
│   ├── register_controller.dart
│   └── forgot_password_controller.dart
├── pages/
│   ├── login_page.dart
│   ├── register_page.dart
│   └── forgot_password_page.dart
└── states/
    ├── login_state.dart
    ├── register_state.dart
    └── forgot_password_state.dart
```
