# login_module

Módulo de autenticação reutilizável em Flutter, construído com clean architecture e desacoplado de qualquer projeto específico.

---

## O que esse módulo faz

- Exibe uma tela de login com validação de formulário
- Executa o fluxo de autenticação via contrato
- Gerencia os estados da UI (inicial, carregando, sucesso, erro)
- Persiste a sessão opcionalmente via contrato
- Notifica o app quando o login foi realizado com sucesso

---

## O que esse módulo não faz

- Não sabe qual API, Firebase ou backend será usado
- Não navega sozinho após o login
- Não salva token por conta própria
- Não depende de nenhum container de injeção de dependência

---

## Estrutura interna

```text
lib/
  login_module.dart          ← barrel público (único import necessário)
  src/
    domain/
      entities/
        auth_session.dart    ← dados da sessão autenticada
      contracts/
        auth_repository.dart ← contrato de autenticação
        session_storage.dart ← contrato de persistência (opcional)
      result.dart            ← Result Pattern (Success / Failure)
      usecases/
        sign_in.dart         ← regra de negócio do login
    presentation/
      states/
        login_state.dart     ← estados da UI
      controllers/
        login_controller.dart
      pages/
        login_page.dart
    login_module.dart        ← ponto de entrada da feature
```

---

## Como adicionar ao projeto

No `pubspec.yaml` do seu app:

```yaml
dependencies:
  login_module:
    path: packages/login_module
```

```bash
flutter pub get
```

---

## Como implementar

### 1. Implementar o contrato de autenticação

Crie uma classe que implemente `AuthRepository` com a lógica real do seu projeto:

```dart
import 'package:login_module/login_module.dart';

class ApiAuthRepository implements AuthRepository {
  @override
  Future<Result<AuthSession>> signIn({
    required String email,
    required String password,
  }) async {
    // sua chamada HTTP, Firebase, etc.
    final response = await dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });

    return Success(AuthSession(
      accessToken: response.data['access_token'],
      userId: response.data['user_id'],
    ));

    // em caso de erro:
    // return Failure('Usuário ou senha inválidos');
  }
}
```

---

### 2. Implementar o contrato de persistência (opcional)

Se quiser que o módulo salve a sessão após o login, implemente `SessionStorage`:

```dart
import 'package:login_module/login_module.dart';

class SharedPrefsSessionStorage implements SessionStorage {
  @override
  Future<void> save(AuthSession session) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', session.accessToken);
    await prefs.setString('user_id', session.userId);
  }

  @override
  Future<AuthSession?> read() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    final userId = prefs.getString('user_id');
    if (token == null || userId == null) return null;
    return AuthSession(accessToken: token, userId: userId);
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('user_id');
  }
}
```

---

### 3. Instanciar e usar o módulo

```dart
import 'package:login_module/login_module.dart';

final loginModule = LoginModule(
  repository: ApiAuthRepository(),
  sessionStorage: SharedPrefsSessionStorage(), // opcional
);
```

---

### 4. Exibir a tela de login

```dart
loginModule.createPage(
  title: 'Entrar',
  onSuccess: () {
    // navegue, carregue perfil, abra a home, etc.
    Navigator.of(context).pushReplacementNamed('/home');
  },
)
```

---

## Fluxo completo

```
Usuário preenche e-mail + senha
        ↓
  LoginPage.submit()
        ↓
  LoginController → LoginLoading
        ↓
  SignIn (use case)
    - normaliza e-mail
    - valida campos
    - chama AuthRepository
        ↓
  AuthRepository (sua implementação)
        ↓
  Success → SessionStorage.save() → LoginSuccess → onSuccess()
  Failure → LoginError → snackbar → LoginInitial
```

---

## Result Pattern

O módulo usa `Result<T>` em vez de exceções:

```dart
sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
}

class Failure<T> extends Result<T> {
  final String message;
}
```

Na sua implementação de `AuthRepository`, retorne `Success` ou `Failure` — não lance exceções.

---

## Com injeção de dependência (GetIt, etc.)

O módulo não depende de nenhum container de DI. Se seu projeto usa GetIt, resolva as dependências antes de passar ao módulo:

```dart
// registro
GetIt.I.registerLazySingleton<AuthRepository>(() => ApiAuthRepository());

// uso
LoginModule(repository: GetIt.I.get<AuthRepository>())
```

---

## AuthSession

Dados disponíveis após login com sucesso:

| Campo | Tipo | Obrigatório |
|---|---|---|
| `accessToken` | `String` | sim |
| `userId` | `String` | sim |
| `refreshToken` | `String?` | não |
