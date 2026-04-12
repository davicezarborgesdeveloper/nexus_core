# Guia de Implementação — Admin Shell

## Visão Geral

O painel administrativo precisa de uma **Shell page** (semelhante à `MainPage` do portfólio) que mantenha AppBar e menu lateral fixos enquanto troca apenas o conteúdo central conforme a página selecionada.

```
AdminShellPage
├── AppBar (fixa — exibe nome do usuário logado)
├── Row
│   ├── SideNav (menu lateral — 6 itens)
│   └── Expanded → conteúdo da página atual
```

---

## 1. Estrutura de arquivos a criar

Dentro de `lib/src/modules/admin/presentation/`:

```
presentation/
├── pages/
│   ├── admin_shell_page.dart          ← NOVO: shell container
│   ├── perfil_page.dart               ← já existe
│   ├── projetos_page.dart             ← já existe
│   ├── experiencias_page.dart         ← já existe
│   ├── habilidades_page.dart          ← já existe
│   ├── configuracoes_page.dart        ← já existe
│   └── seguranca_page.dart            ← já existe
└── widgets/
    ├── admin_app_bar.dart             ← NOVO: AppBar com nome do usuário
    └── admin_side_nav.dart            ← NOVO: menu lateral
```

---

## 2. Obtendo o nome do usuário logado

O `AuthSession` (em `packages/login_module`) armazena `userId` e `accessToken`. O nome do usuário vem do **Firebase Auth** ou do **Firestore**.

### Opção A — Firebase Auth (mais simples)

```dart
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser;
final displayName = user?.displayName ?? user?.email ?? 'Admin';
```

> Use `user.displayName` se o nome foi definido no cadastro, ou `user.email` como fallback.

### Opção B — Firestore (nome editável pelo próprio painel)

Ler o documento do usuário em `users/{userId}` e expor via controller.

---

## 3. AdminShellPage

É uma `StatefulWidget` que controla qual página está ativa através de um índice.

**Responsabilidades:**
- Manter `int _selectedIndex` via `setState`
- Renderizar a `AdminAppBar` passando o nome do usuário
- Renderizar `AdminSideNav` passando o índice atual e o callback de troca
- Exibir o widget da página correspondente ao índice

**Mapeamento de índice → página:**

| Índice | Página                  |
|--------|-------------------------|
| 0      | `PerfilPage`            |
| 1      | `ProjetosPage`          |
| 2      | `ExperienciasPage`      |
| 3      | `HabilidadesPage`       |
| 4      | `ConfiguracoesPage`     |
| 5      | `SegurancaPage`         |

**Dica de implementação:** Use `IndexedStack` para manter o estado das páginas ao trocar de aba, ou instancie a página diretamente se não precisar preservar estado entre trocas.

```dart
// com IndexedStack (preserva estado):
IndexedStack(
  index: _selectedIndex,
  children: [PerfilPage(...), ProjetosPage(...), ...],
)

// sem IndexedStack (simples, reconstrói ao trocar):
_pages[_selectedIndex]
```

---

## 4. AdminAppBar

`PreferredSizeWidget` com `preferredSize = Size.fromHeight(kToolbarHeight)`.

**Conteúdo:**
- **Esquerda:** Título "Painel Administrativo" + badge "Admin" (como na screenshot)
- **Direita:** Botão "Ver portfólio" + Botão "Sair"
- **Exibição do usuário:** O nome vem de um `ValueNotifier<String>` ou passado direto como `String userName` via construtor

**"Ver portfólio"** → `Navigator.of(context).pop()` (volta para `MainPage`)

**"Sair"** → chama `LoginController.logout()` (disponível via `getIt<LoginModule>().createController()`) → `Navigator.of(context).popUntil((r) => r.isFirst)`

---

## 5. AdminSideNav

Widget fixo à esquerda com largura definida (ex: `260px`).

**Itens de menu:**

```dart
final items = [
  (icon: Icons.person_outline,     label: 'Perfil'),
  (icon: Icons.folder_outlined,    label: 'Projetos'),
  (icon: Icons.work_outline,       label: 'Experiências'),
  (icon: Icons.bolt_outlined,      label: 'Habilidades'),
  (icon: Icons.settings_outlined,  label: 'Configurações'),
  (icon: Icons.shield_outlined,    label: 'Segurança'),
];
```

**Item ativo:** destaque com fundo azul + texto branco (seguindo a cor `ColorManager.primary` já definida no projeto).

**Responsividade:**
- Em desktop (≥ 1024px): menu lateral visível permanentemente
- Em tablet/mobile: usar `Drawer` com `Scaffold.drawer`, igual ao `MainDrawer` do portfólio

---

## 6. Ajuste no AdminModule

O `admin_module.dart` atual expõe `createPage()` que retorna diretamente a `PerfilPage`. Mude para retornar a `AdminShellPage`:

```dart
// Antes:
AdminModule().createPage() → PerfilPage

// Depois:
AdminModule().createPage() → AdminShellPage
```

A `AdminShellPage` recebe os controllers/usecases necessários via construtor ou os instancia internamente usando o próprio `AdminModule` como factory.

---

## 7. Wiring com o fluxo de login existente

O fluxo atual em `MainPage._onSettingsTap()` já faz:

```
LoginPage (onSuccess callback)
  → Navigator.push(AdminModule().createPage())
```

**Nenhuma mudança é necessária no fluxo de navegação.** Basta o `AdminModule.createPage()` retornar `AdminShellPage` em vez de `PerfilPage`.

---

## 8. Passagem de controllers para as páginas

Cada página já tem seu próprio controller gerado pelo brick. A `AdminShellPage` pode:

**Opção A — Instanciar todos de uma vez na shell (mais simples):**
```dart
// dentro de AdminShellPage.initState()
final _perfilController = PerfilController(usecase);
final _projetosController = ProjetosController(usecase);
// ...
```

**Opção B — Instanciar sob demanda (lazy), só quando a página for acessada pela primeira vez.**

Para o início, a Opção A é mais direta e segue o padrão já existente no `AdminModule`.

---

## 9. Ordem de implementação sugerida

1. **`AdminAppBar`** — widget simples, sem estado, testa visual imediato
2. **`AdminSideNav`** — widget sem estado, recebe índice e callback
3. **`AdminShellPage`** — monta a shell com AppBar + SideNav + IndexedStack
4. **Ajuste `AdminModule.createPage()`** — troca `PerfilPage` por `AdminShellPage`
5. **Testar navegação** — login → shell → trocar páginas → sair
6. **Responsividade** — adaptar SideNav para Drawer em mobile/tablet
