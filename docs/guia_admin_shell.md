# Guia de Implementação — Admin Shell

## Visão Geral

O painel administrativo precisa de uma **Shell page** que mantenha AppBar e menu lateral fixos enquanto troca apenas o conteúdo central. O padrão é idêntico ao já usado na `MainPage` do portfólio — um widget container que orquestra os filhos.

```
AdminShellPage  (Scaffold único)
├── AdminAppBar         → fixa no topo, exibe nome do usuário
└── body: Row
    ├── AdminSideNav    → menu lateral fixo (desktop) / Drawer (mobile)
    └── Expanded
        └── IndexedStack → exibe a página ativa sem destruir as outras
```

A navegação entre páginas é feita trocando o `index` do `IndexedStack` via `setState` — sem `Navigator.push`, sem rotas.

---

## 1. Estrutura de arquivos

Dentro de `lib/src/modules/admin/presentation/`:

```
presentation/
├── pages/
│   ├── admin_shell_page.dart     ← CRIAR
│   ├── perfil_page.dart          ← MODIFICAR (remover Scaffold interno)
│   ├── projetos_page.dart        ← MODIFICAR
│   ├── experiencias_page.dart    ← MODIFICAR
│   ├── habilidades_page.dart     ← MODIFICAR
│   ├── configuracoes_page.dart   ← MODIFICAR
│   └── seguranca_page.dart       ← MODIFICAR
└── widgets/
    ├── admin_app_bar.dart        ← CRIAR
    └── admin_side_nav.dart       ← CRIAR
```

E em `lib/src/modules/admin/`:
```
admin_module.dart   ← MODIFICAR (retornar AdminShellPage)
```

---

## 2. Obtendo o nome do usuário logado

Após o login com Firebase, `FirebaseAuth.instance.currentUser` já está populado. Ele é acessível de qualquer lugar sem necessidade de passar parâmetros pela árvore.

### Como ler o nome

O Firebase guarda `displayName` (nome completo definido no cadastro) e `email`. Na prática, use `displayName` com fallback para a parte local do e-mail:

```dart
import 'package:firebase_auth/firebase_auth.dart';

String _resolveUserName() {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return 'Admin';
  if (user.displayName != null && user.displayName!.isNotEmpty) {
    return user.displayName!;
  }
  // fallback: pega só a parte antes do @ do e-mail
  return user.email?.split('@').first ?? 'Admin';
}
```

### Onde chamar

Dentro do `initState` da `AdminShellPage`, antes do primeiro `build`:

```dart
late String _userName;

@override
void initState() {
  super.initState();
  _userName = _resolveUserName();
  // ... inicialização dos controllers
}
```

> Não use `FutureBuilder` nem `StreamBuilder` aqui — o `currentUser` é síncrono e já está disponível após o login.

---

## 3. Modificando as páginas existentes

Cada página gerada pelo brick tem seu próprio `Scaffold`. Dentro da shell, cada página será um **filho do `IndexedStack`** — se cada uma tiver seu próprio `Scaffold`, haverá AppBars sobrepostas e comportamento incorreto.

A solução é remover o `Scaffold` e o `AppBar` de cada página, deixando apenas o corpo. O `Scaffold` único fica na `AdminShellPage`.

### Antes (gerado pelo brick):

```dart
// perfil_page.dart
@override
Widget build(BuildContext context) {
  return Scaffold(                          // ← remover
    appBar: AppBar(title: Text(widget.title)), // ← remover
    body: SafeArea(
      child: ValueListenableBuilder<PerfilState>(
        valueListenable: widget.controller,
        builder: (context, state, _) {
          if (state is PerfilLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PerfilError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Perfil'));
        },
      ),
    ),
  );
}
```

### Depois (sem Scaffold):

```dart
// perfil_page.dart
@override
Widget build(BuildContext context) {
  return ValueListenableBuilder<PerfilState>(
    valueListenable: widget.controller,
    builder: (context, state, _) {
      if (state is PerfilLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is PerfilError) {
        return Center(child: Text(state.message));
      }
      return const Center(child: Text('Perfil'));
    },
  );
}
```

Aplique o mesmo padrão nas outras 5 páginas (`ProjetosPage`, `ExperienciasPage`, `HabilidadesPage`, `ConfiguracoesPage`, `SegurancaPage`) — todas seguem estrutura idêntica, só trocando o tipo do state e o texto.

> O parâmetro `title` do construtor pode ser mantido para uso futuro, mas não é mais usado no `build`.

---

## 4. AdminAppBar

`StatelessWidget` que implementa `PreferredSizeWidget`, igual ao `AppBarNexusCore` já existente no portfólio.

### Estrutura visual

```
[ Painel Administrativo  [Admin] ]  ←→  [ Ver portfólio ↗  Sair → ]
─────────────────────────────────────────────────────────────────────  (divider)
```

Em mobile, o título "Ver portfólio" é omitido e aparece um ícone de hambúrguer à esquerda para abrir o `Drawer`.

### Código completo

```dart
// lib/src/modules/admin/presentation/widgets/admin_app_bar.dart

import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final VoidCallback? onViewPortfolio;
  final VoidCallback? onSignOut;

  const AdminAppBar({
    super.key,
    required this.userName,
    this.onViewPortfolio,
    this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return AppBar(
      backgroundColor: ColorManager.background,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      // Divider inferior igual ao AppBarNexusCore
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(
          height: 1,
          thickness: 1,
          color: ColorManager.neutral.shade200,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            // Em mobile: ícone hambúrguer para abrir o Drawer
            if (isMobile) ...[
              GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  Icons.menu,
                  color: ColorManager.secondary,
                ),
              ),
              const SizedBox(width: 12),
            ],

            // Título
            Text(
              'Painel Administrativo',
              style: getBoldStyle(
                color: ColorManager.textPrimary,
                fontSize: isMobile ? FontSize.s16 : FontSize.s20,
              ).spaceGrotesk,
            ),
            const SizedBox(width: 8),

            // Badge "Admin"
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Admin',
                style: getRegularStyle(
                  color: Colors.white,
                  fontSize: FontSize.s12,
                ).inter,
              ),
            ),

            const Spacer(),

            // Botão "Ver portfólio" (só desktop)
            if (!isMobile)
              TextButton.icon(
                onPressed: onViewPortfolio,
                icon: const Icon(Icons.open_in_new, size: 16),
                label: const Text('Ver portfólio'),
                style: TextButton.styleFrom(
                  foregroundColor: ColorManager.textSecondary,
                  textStyle: getMediumStyle(
                    color: ColorManager.textSecondary,
                    fontSize: FontSize.s14,
                  ).inter,
                ),
              ),

            // Botão "Sair"
            TextButton.icon(
              onPressed: onSignOut,
              icon: const Icon(Icons.logout, size: 16),
              label: isMobile
                  ? const SizedBox.shrink()
                  : const Text('Sair'),
              style: TextButton.styleFrom(
                foregroundColor: ColorManager.textSecondary,
                textStyle: getMediumStyle(
                  color: ColorManager.textSecondary,
                  fontSize: FontSize.s14,
                ).inter,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // +1 pelo divider inferior, igual ao AppBarNexusCore
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
```

### Por que `Scaffold.of(context)` funciona dentro do AppBar

O `AppBar` é um `StatelessWidget` normal. Quando o `Scaffold` chama `appBar.build(context)`, ele passa um `BuildContext` que já é **filho do próprio Scaffold** na árvore de elementos — por isso `Scaffold.of(context)` encontra o Scaffold correto. Esse é exatamente o mesmo padrão usado no `AppBarNexusCore` do portfólio.

---

## 5. AdminSideNav

`StatelessWidget` que recebe o índice ativo e um callback de seleção. Não mantém estado — quem mantém é a `AdminShellPage`.

### Estrutura visual

```
│ ● Perfil           │  ← item ativo: fundo primary, texto branco
│   Projetos         │  ← inativo: fundo transparente, texto secondary
│   Experiências     │
│   Habilidades      │
│   Configurações    │
│   Segurança        │
│                    │
```

### Código completo

```dart
// lib/src/modules/admin/presentation/widgets/admin_side_nav.dart

import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem(this.icon, this.label);
}

class AdminSideNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  // Lista estática — ordem deve corresponder ao IndexedStack da shell
  static const _items = [
    _NavItem(Icons.person_outline,    'Perfil'),
    _NavItem(Icons.folder_outlined,   'Projetos'),
    _NavItem(Icons.work_outline,      'Experiências'),
    _NavItem(Icons.bolt_outlined,     'Habilidades'),
    _NavItem(Icons.settings_outlined, 'Configurações'),
    _NavItem(Icons.shield_outlined,   'Segurança'),
  ];

  const AdminSideNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      // Borda direita separando nav do conteúdo
      decoration: BoxDecoration(
        color: ColorManager.background,
        border: Border(
          right: BorderSide(
            color: ColorManager.neutral.shade200,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          final isSelected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Material(
              color: isSelected
                  ? ColorManager.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => onItemSelected(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        item.icon,
                        size: 18,
                        color: isSelected
                            ? Colors.white
                            : ColorManager.textSecondary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item.label,
                        style: getMediumStyle(
                          color: isSelected
                              ? Colors.white
                              : ColorManager.textSecondary,
                          fontSize: FontSize.s14,
                        ).inter,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
```

### Uso como Drawer (mobile/tablet)

Quando usado dentro do `Scaffold.drawer`, envolva em `SafeArea` para respeitar o status bar:

```dart
drawer: Drawer(
  child: SafeArea(
    child: AdminSideNav(
      selectedIndex: _selectedIndex,
      onItemSelected: (index) {
        setState(() => _selectedIndex = index);
        Navigator.of(context).pop(); // fecha o drawer
      },
    ),
  ),
),
```

---

## 6. AdminShellPage

É o coração da implementação. `StatefulWidget` responsável por:

1. Instanciar todos os controllers no `initState`
2. Resolver o nome do usuário logado
3. Controlar qual página está visível via `_selectedIndex`
4. Montar o layout: `Scaffold` → `AppBar` + `body (Row)`
5. Adaptar para mobile com `Drawer`
6. Executar o logout

### Sobre os controllers

Cada página precisa de seu controller. Olhando os arquivos existentes:

| Controller           | Construtor              |
|----------------------|-------------------------|
| `PerfilController`   | `PerfilController(usecase)` — precisa do usecase |
| `ProjetosController` | `ProjetosController()` — sem dependências |
| `ExperienciasController` | `ExperienciasController()` |
| `HabilidadesController`  | `HabilidadesController()` |
| `ConfiguracoesController`| `ConfiguracoesController()` |
| `SegurancaController`    | `SegurancaController()` |

O `usecase` vem da cadeia criada pelo `AdminModule` (datasource → repository → usecase), que já é passado via construtor para a shell.

### Sobre o logout

O fluxo de navegação após o login é:
```
MainPage  →push→  LoginPage  →pushReplacement→  AdminShellPage
```
A pilha final é: `[MainPage, AdminShellPage]`

Portanto, para voltar ao portfólio basta `Navigator.of(context).pop()`.
Para sair (logout), chame `FirebaseAuth.instance.signOut()` antes do pop.

### Código completo

```dart
// lib/src/modules/admin/presentation/pages/admin_shell_page.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/size_screen_manager.dart';
import 'package:nexus_core/src/modules/admin/domain/usecases/get_admin_usecase.dart';
import 'package:nexus_core/src/modules/admin/presentation/controllers/configuracoes_controller.dart';
import 'package:nexus_core/src/modules/admin/presentation/controllers/experiencias_controller.dart';
import 'package:nexus_core/src/modules/admin/presentation/controllers/habilidades_controller.dart';
import 'package:nexus_core/src/modules/admin/presentation/controllers/perfil_controller.dart';
import 'package:nexus_core/src/modules/admin/presentation/controllers/projetos_controller.dart';
import 'package:nexus_core/src/modules/admin/presentation/controllers/seguranca_controller.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/configuracoes_page.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/experiencias_page.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/habilidades_page.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/perfil_page.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/projetos_page.dart';
import 'package:nexus_core/src/modules/admin/presentation/pages/seguranca_page.dart';
import 'package:nexus_core/src/modules/admin/presentation/widgets/admin_app_bar.dart';
import 'package:nexus_core/src/modules/admin/presentation/widgets/admin_side_nav.dart';

class AdminShellPage extends StatefulWidget {
  final IGetAdminUsecase usecase;

  const AdminShellPage({super.key, required this.usecase});

  @override
  State<AdminShellPage> createState() => _AdminShellPageState();
}

class _AdminShellPageState extends State<AdminShellPage> {
  int _selectedIndex = 0;
  late String _userName;

  // Controllers instanciados uma única vez no initState
  late final PerfilController _perfilController;
  late final ProjetosController _projetosController;
  late final ExperienciasController _experienciasController;
  late final HabilidadesController _habilidadesController;
  late final ConfiguracoesController _configuracoesController;
  late final SegurancaController _segurancaController;

  @override
  void initState() {
    super.initState();

    // Resolve nome do usuário logado via Firebase
    final user = FirebaseAuth.instance.currentUser;
    _userName = user?.displayName?.isNotEmpty == true
        ? user!.displayName!
        : user?.email?.split('@').first ?? 'Admin';

    // Instancia controllers — PerfilController precisa do usecase
    _perfilController       = PerfilController(widget.usecase);
    _projetosController     = ProjetosController();
    _experienciasController = ExperienciasController();
    _habilidadesController  = HabilidadesController();
    _configuracoesController = ConfiguracoesController();
    _segurancaController    = SegurancaController();
  }

  @override
  void dispose() {
    // Sempre descartar ValueNotifiers para evitar memory leaks
    _perfilController.dispose();
    _projetosController.dispose();
    _experienciasController.dispose();
    _habilidadesController.dispose();
    _configuracoesController.dispose();
    _segurancaController.dispose();
    super.dispose();
  }

  // Logout: encerra sessão Firebase e volta para MainPage
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) Navigator.of(context).pop();
  }

  // Volta ao portfólio sem deslogar
  void _viewPortfolio() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile || context.isTablet;

    // SideNav é compartilhado entre o layout desktop e o Drawer mobile
    final sideNav = AdminSideNav(
      selectedIndex: _selectedIndex,
      onItemSelected: (index) {
        setState(() => _selectedIndex = index);
        if (isMobile) Navigator.of(context).pop(); // fecha drawer
      },
    );

    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AdminAppBar(
        userName: _userName,
        onViewPortfolio: _viewPortfolio,
        onSignOut: _signOut,
      ),
      // Drawer aparece apenas em mobile/tablet
      drawer: isMobile
          ? Drawer(child: SafeArea(child: sideNav))
          : null,
      body: Row(
        children: [
          // Menu lateral permanente em desktop
          if (!isMobile) sideNav,

          // Conteúdo — IndexedStack mantém estado de cada página ao navegar
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                PerfilPage(controller: _perfilController),
                ProjetosPage(controller: _projetosController),
                ExperienciasPage(controller: _experienciasController),
                HabilidadesPage(controller: _habilidadesController),
                ConfiguracoesPage(controller: _configuracoesController),
                SegurancaPage(controller: _segurancaController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### Por que `IndexedStack` e não `switch`/`if`

Com `IndexedStack`, todos os widgets são construídos e mantidos na memória, mas apenas o do índice ativo é visível. Isso garante que se o usuário preencher um formulário em "Perfil", trocar para "Projetos" e voltar, o formulário ainda estará preenchido.

Com `_pages[_selectedIndex]` (sem IndexedStack), o widget é destruído e reconstruído a cada troca — os dados inseridos se perdem.

---

## 7. Ajuste no AdminModule

O `admin_module.dart` atual cria a cadeia de dependências e retorna `PerfilPage`. Mude para retornar `AdminShellPage`, passando apenas o `usecase` — a shell cria os outros controllers por conta própria.

### Antes

```dart
// admin_module.dart atual
PerfilPage createPage({String title = 'Perfil'}) {
  final datasource = AdminDatasourceImpl();
  final repository = AdminRepositoryImpl(datasource);
  final usecase    = GetAdminUsecase(repository);
  final controller = PerfilController(usecase);

  return PerfilPage(
    controller: controller,
    title: title,
  );
}
```

### Depois

```dart
// admin_module.dart modificado
import 'presentation/pages/admin_shell_page.dart'; // novo import

AdminShellPage createPage() {
  final datasource = AdminDatasourceImpl();
  final repository = AdminRepositoryImpl(datasource);
  final usecase    = GetAdminUsecase(repository);

  return AdminShellPage(usecase: usecase);
}
```

> Remova o parâmetro `title` — ele não faz mais sentido já que a shell não tem título de página, cada página gerencia seu próprio cabeçalho de conteúdo.

---

## 8. Fluxo de navegação completo

Nenhuma mudança no `MainPage` é necessária. O `_onSettingsTap` já existente cuida de tudo:

```dart
// main_page.dart — código existente, não alterar
void _onSettingsTap() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (pageContext) => _loginModule.createPage(
        onSuccess: () => Navigator.of(pageContext).pushReplacement(
          MaterialPageRoute(builder: (_) => _adminModule.createPage()),
          //                                                 ↑
          //          agora retorna AdminShellPage em vez de PerfilPage
        ),
      ),
    ),
  );
}
```

**Pilha de navegação resultante:**

```
1. MainPage           ← base, nunca sai da pilha
2. LoginPage          ← push
   ↓ (após sucesso)
2. AdminShellPage     ← pushReplacement (LoginPage é substituída)
```

**"Ver portfólio"** → `Navigator.pop()` → volta para `MainPage`  
**"Sair"** → `FirebaseAuth.signOut()` + `Navigator.pop()` → volta para `MainPage`

---

## 9. Ordem de implementação sugerida

Siga esta ordem para poder testar cada etapa isoladamente:

### Passo 1 — `AdminAppBar`
Crie `widgets/admin_app_bar.dart`. Teste chamando diretamente:
```dart
// temporário, só para ver o visual
runApp(MaterialApp(home: Scaffold(appBar: AdminAppBar(userName: 'Davi'))));
```

### Passo 2 — `AdminSideNav`
Crie `widgets/admin_side_nav.dart`. Teste isolado com índice fixo:
```dart
AdminSideNav(selectedIndex: 0, onItemSelected: (i) => print(i))
```

### Passo 3 — Modificar as 6 páginas
Remova o `Scaffold` de cada página. A ordem sugerida é da mais simples para a mais complexa: `SegurancaPage` → `ConfiguracoesPage` → `HabilidadesPage` → `ExperienciasPage` → `ProjetosPage` → `PerfilPage`.

### Passo 4 — `AdminShellPage`
Crie `pages/admin_shell_page.dart` com o código completo da seção 6.

### Passo 5 — Atualizar `AdminModule`
Troque o retorno de `PerfilPage` para `AdminShellPage` conforme a seção 7.

### Passo 6 — Testar o fluxo completo
```
flutter run -d chrome
→ clique no ícone de engrenagem
→ faça login
→ verifique: shell aparece com AppBar e menu lateral
→ clique em cada item do menu
→ clique em "Ver portfólio" → deve voltar ao portfólio
→ faça login novamente → clique em "Sair" → deve voltar ao portfólio
```

### Passo 7 — Responsividade
Redimensione a janela abaixo de 600px e verifique:
- Menu lateral some
- Ícone hambúrguer aparece na AppBar
- Drawer abre ao clicar no hambúrguer
- Drawer fecha ao selecionar um item
