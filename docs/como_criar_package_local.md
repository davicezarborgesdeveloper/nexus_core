# Como transformar um módulo Flutter em package local

## Objetivo

Extrair uma feature do projeto principal para um package local reutilizável,
mantendo o desacoplamento e permitindo reaproveitamento em outros apps.

---

## Quando fazer isso?

Quando o módulo:

- tem responsabilidade bem definida
- usa contratos em vez de implementações concretas
- não depende de detalhes do projeto que o consome

---

## Estrutura final esperada

```text
packages/
  meu_modulo/
    pubspec.yaml
    lib/
      meu_modulo.dart       ← barrel público
      src/
        domain/
          entities/
          contracts/
          usecases/
        presentation/
          states/
          controllers/
          pages/
        meu_modulo.dart     ← classe principal do módulo
```

---

## Passo a passo

### Passo 1 — Criar o `pubspec.yaml` do package

```
packages/meu_modulo/pubspec.yaml
```

```yaml
name: meu_modulo
description: Descrição do módulo.
publish_to: none

version: 1.0.0

environment:
  sdk: ^3.9.2

dependencies:
  flutter:
    sdk: flutter
```

> O campo `name` define o identificador usado nos imports: `package:meu_modulo/...`

---

### Passo 2 — Criar o barrel público

```
packages/meu_modulo/lib/meu_modulo.dart
```

```dart
export 'src/domain/entities/foo.dart';
export 'src/domain/contracts/foo_repository.dart';
export 'src/domain/result.dart';
export 'src/domain/usecases/foo_usecase.dart';
export 'src/presentation/states/foo_state.dart';
export 'src/presentation/controllers/foo_controller.dart';
export 'src/presentation/pages/foo_page.dart';
export 'src/meu_modulo.dart';
```

Quem consome o package importa **apenas esse arquivo**.

---

### Passo 3 — Referenciar no projeto principal

Em `pubspec.yaml` do projeto:

```yaml
dependencies:
  meu_modulo:
    path: packages/meu_modulo
```

Rodar no terminal:

```bash
flutter pub get
```

---

### Passo 4 — Atualizar os imports do projeto

Substituir imports locais pelo import do package:

```dart
// antes
import 'package:nexus_core/src/modules/meu_modulo/...';

// depois
import 'package:meu_modulo/meu_modulo.dart';
```

---

## O que torna isso possível

O módulo só funciona como package independente quando ele usa **contratos (classes abstratas)**
em vez de implementações concretas.

```
módulo conhece     →  AuthRepository (abstract)
projeto fornece    →  ApiAuthRepository (implements AuthRepository)
```

O módulo nunca sabe se por baixo há REST, Firebase, mock ou qualquer outra coisa.

---

## Exemplo real: login_module

Este projeto já usa esse padrão. O módulo de login foi extraído para:

```
packages/login_module/
```

E o projeto consome assim:

```dart
// infra/auth/api_auth_repository.dart
import 'package:login_module/login_module.dart';

class ApiAuthRepository implements AuthRepository { ... }
```

```dart
// main_page.dart
import 'package:login_module/login_module.dart';

_loginModule = LoginModule(repository: ApiAuthRepository());
```

---

## Replicando para outros módulos

| Etapa | O que fazer |
|---|---|
| Criar `packages/novo_modulo/pubspec.yaml` | Definir nome e dependências |
| Criar `packages/novo_modulo/lib/novo_modulo.dart` | Exportar tudo que é público |
| Copiar os arquivos do módulo para `packages/novo_modulo/lib/src/` | Ajustar imports relativos |
| Adicionar `path: packages/novo_modulo` no `pubspec.yaml` principal | Registrar o package |
| Rodar `flutter pub get` | Resolver dependências |
| Atualizar imports no projeto | Usar `package:novo_modulo/novo_modulo.dart` |

---

## Benefícios

- **Reaproveitamento** entre vários apps: basta copiar a pasta `packages/novo_modulo/`
- **Versionamento independente**: cada módulo tem sua própria versão no `pubspec.yaml`
- **Manutenção centralizada**: mudanças no módulo refletem em todos os apps que o usam
- **Baixo acoplamento**: o módulo não conhece o projeto que o consome

---

## O que NÃO colocar dentro do package

- Implementações concretas (`Dio`, `Firebase`, `SharedPreferences`)
- Lógica específica de um projeto
- Navegação hardcoded
- Dependências do projeto principal

Esses itens ficam em `lib/src/infra/` do projeto principal.
