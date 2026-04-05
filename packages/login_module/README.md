# login_module

Módulo de autenticação reutilizável em Flutter, construído com clean architecture e desacoplado de qualquer projeto específico.

---

## O que esse módulo faz

- Exibe uma tela de login com validação de formulário e campo "lembrar-me"
- Executa o fluxo de autenticação via contrato
- Gerencia os estados da UI (inicial, carregando, sucesso, erro, logout)
- Persiste a sessão opcionalmente via contrato
- Notifica o app quando o login foi realizado com sucesso
- Expõe método `logout()` para encerrar a sessão

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
  login_module.dart               ← barrel público (único import necessário)
  src/
    domain/
      entities/
        auth_session.dart         ← dados da sessão autenticada
      contracts/
        auth_repository.dart      ← contrato de autenticação
        session_storage.dart      ← contrato de persistência (opcional)
      errors/
        auth_failure.dart         ← erros tipados (AuthFailure)
      result.dart                 ← Result<T, E> (Success / Failure)
      usecases/
        sign_in.dart              ← regra de negócio do login
        sign_out.dart             ← regra de negócio do logout
    infra/
      in_memory_session_storage.dart ← implementação de referência (testes)
    presentation/
      states/
        login_state.dart          ← estados da UI
      controllers/
        login_controller.dart
      pages/
        login_page.dart
    login_module.dart             ← ponto de entrada da feature
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

## Como consumir o módulo

### Ponto único de configuração

Toda a configuração acontece em **um único lugar**: onde você instancia o `LoginModule`.
É aqui que você decide qual tecnologia será usada — o módulo não sabe e não precisa saber.

```dart
// Você escolhe qual implementação injetar
final loginModule = LoginModule(
  repository: MinhaImplementacaoAuthRepository(),
  sessionStorage: MinhaImplementacaoSessionStorage(), // opcional
);
```

> O `AuthRepository` e o `SessionStorage` são **contratos (interfaces)**.
> O módulo chama `repository.signIn()` sem se importar se por baixo é HTTP, Firebase, Supabase ou um mock.

### Exemplos de configuração

```dart
// Mock para desenvolvimento
LoginModule(repository: ApiAuthRepository())

// HTTP real
LoginModule(
  repository: HttpAuthRepository(baseUrl: 'https://api.exemplo.com'),
  sessionStorage: SharedPrefsSessionStorage(),
)

// Firebase
LoginModule(
  repository: FirebaseAuthRepository(),
  sessionStorage: SharedPrefsSessionStorage(),
)

// Supabase
LoginModule(
  repository: SupabaseAuthRepository(),
  sessionStorage: SharedPrefsSessionStorage(),
)
```

Trocar de Firebase para Supabase? Muda **apenas essa linha**. A tela, o controller e as regras de negócio não precisam ser tocados.

---

## Criando suas implementações

### AuthRepository

Implemente o contrato de autenticação com a tecnologia do seu projeto:

```dart
import 'package:login_module/login_module.dart';

class HttpAuthRepository implements AuthRepository {
  @override
  Future<Result<AuthSession, AuthFailure>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post('/auth/sign-in', data: {
        'email': email,
        'password': password,
      });

      return Success(AuthSession(
        accessToken: response.data['accessToken'],
        userId: response.data['userId'],
        refreshToken: response.data['refreshToken'],
      ));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(InvalidCredentials());
      }
      return Failure(NetworkFailure(e.message));
    }
  }
}
```

### SessionStorage (opcional)

Implemente o contrato de persistência de sessão:

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

> Para testes, o módulo exporta `InMemorySessionStorage` — uma implementação em memória sem dependências externas.

---

## Exibindo a tela de login

```dart
loginModule.createPage(
  title: 'Entrar',
  onSuccess: () {
    Navigator.of(context).pushReplacementNamed('/home');
  },
)
```

A página inclui o campo **"Lembrar-me"**. Quando marcado, a sessão é salva via `SessionStorage`. Quando desmarcado, a sessão não é persistida (útil para login temporário).

---

## Logout

O controller expõe `logout()`, que limpa a sessão e emite o estado `LoggedOut`:

```dart
final controller = loginModule.createController();

// Em algum botão de logout
await controller.logout();

// Ouvindo o estado
ValueListenableBuilder<LoginState>(
  valueListenable: controller,
  builder: (context, state, _) {
    if (state is LoggedOut) {
      // redirecionar para login
    }
    // ...
  },
)
```

---

## Fluxo completo

```
Usuário preenche e-mail + senha + lembrar-me
        ↓
  LoginPage.submit()
        ↓
  LoginController → LoginLoading
        ↓
  SignIn (use case)
    - normaliza e-mail
    - valida campos
    - chama AuthRepository.signIn()
        ↓
  Sua implementação (HTTP / Firebase / Supabase...)
        ↓
  Success → se rememberMe: SessionStorage.save() → LoginSuccess → onSuccess()
  Failure → LoginError → snackbar com error.message → LoginInitial
```

---

## Estados da UI

| Estado | Descrição |
|---|---|
| `LoginInitial` | Estado inicial, formulário disponível |
| `LoginLoading` | Requisição em andamento, botão desabilitado |
| `LoginSuccess` | Login realizado, `onSuccess` é chamado |
| `LoginError` | Falha no login, acesse `state.error.message` |
| `LoggedOut` | Sessão encerrada via `logout()` |

---

## Erros tipados (AuthFailure)

O módulo usa erros tipados em vez de strings soltas:

| Tipo | Quando usar |
|---|---|
| `InvalidCredentials` | Credenciais incorretas (HTTP 401) |
| `NetworkFailure` | Falha de rede ou timeout |
| `ValidationFailure` | Dados inválidos antes de chamar a API |

```dart
// Na sua implementação
return const Failure(InvalidCredentials());
return Failure(NetworkFailure('Timeout'));
return const Failure(ValidationFailure('E-mail inválido'));

// Na UI (já tratado automaticamente pela LoginPage)
if (state is LoginError) {
  print(state.error.message); // mensagem amigável pronta
}
```

---

## Result Pattern

O módulo usa `Result<T, E>` em vez de exceções:

```dart
sealed class Result<T, E extends Object> {}

class Success<T, E extends Object> extends Result<T, E> {
  final T data;
}

class Failure<T, E extends Object> extends Result<T, E> {
  final E error;
}
```

Na sua implementação de `AuthRepository`, retorne `Success` ou `Failure` — não lance exceções.

---

## AuthSession

Dados disponíveis após login com sucesso:

| Campo | Tipo | Obrigatório |
|---|---|---|
| `accessToken` | `String` | sim |
| `userId` | `String` | sim |
| `refreshToken` | `String?` | não |

---

## Com injeção de dependência (GetIt, etc.)

O módulo não depende de nenhum container de DI. Se seu projeto usa GetIt, resolva as dependências antes de passar ao módulo:

```dart
// registro
GetIt.I.registerLazySingleton<AuthRepository>(() => HttpAuthRepository(
  baseUrl: 'https://api.exemplo.com',
));

// uso
LoginModule(repository: GetIt.I.get<AuthRepository>())
```
