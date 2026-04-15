# clean_page

Adiciona uma page com controller e state a um módulo existente.

## Uso

```bash
mason make clean_page --module_name auth --page_name login
```

Ou de forma interativa:

```bash
mason make clean_page
```

## Variáveis

| Variável      | Descrição                   | Exemplo  |
|---------------|-----------------------------|----------|
| `module_name` | Nome do módulo já existente | `auth`   |
| `page_name`   | Nome da page a ser criada   | `login`  |

## Arquivos gerados

```
lib/src/modules/<module_name>/presentation/
└── pages/
    └── <page_name>/
        ├── <page_name>_state.dart
        ├── <page_name>_controller.dart
        └── <page_name>_page.dart
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
└── pages/
    ├── login/
    │   ├── login_state.dart
    │   ├── login_controller.dart
    │   └── login_page.dart
    ├── register/
    │   ├── register_state.dart
    │   ├── register_controller.dart
    │   └── register_page.dart
    └── forgot_password/
        ├── forgot_password_state.dart
        ├── forgot_password_controller.dart
        └── forgot_password_page.dart
```
