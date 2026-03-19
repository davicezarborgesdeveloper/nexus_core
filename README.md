# Nexus Core

Portfólio profissional desenvolvido com Flutter, apresentando habilidades, experiências e projetos de Davi Cezário Borges — Desenvolvedor Full Stack.

---

## Sobre o Projeto

O **Nexus Core** é uma aplicação de portfólio pessoal responsiva, pensada para funcionar em dispositivos móveis, tablets e web. O objetivo é apresentar de forma clara e elegante o perfil profissional, competências técnicas, trajetória de carreira e formas de contato.

---

## Funcionalidades

- **Seção Hero** — Apresentação com título, badge de disponibilidade para novos projetos e métricas de destaque (5+ anos de experiência, 50+ projetos, 20+ clientes)
- **Habilidades** — Grade de categorias técnicas: Frontend, Backend, DevOps e Soft Skills
- **Experiências** — Linha do tempo da trajetória profissional
- **Navegação** — Drawer lateral com links para redes sociais (GitHub, LinkedIn, E-mail)
- **Troca de idioma** — Suporte a 7 idiomas: Português, Inglês, Espanhol, Francês, Alemão e Italiano
- **Tema escuro** — Interface com Material Design 3 e tema escuro por padrão

---

## Tecnologias

| Categoria | Tecnologias |
|---|---|
| Framework | Flutter (SDK ^3.9.2) |
| Design | Material Design 3, fontes Inter e Space Grotesk |
| Internacionalização | `intl`, arquivos `.arb` para 7 idiomas |
| HTTP | `dio` ^5.9.1 |
| Links externos | `url_launcher` ^6.3.2 |
| UI | `flutter_svg`, `auto_size_text`, `timeline_tile` |
| Plataforma | `device_info_plus`, `permission_handler` |
| Arquivos | `path_provider`, `open_file`, `universal_html` |

---

## Estrutura do Projeto

```
lib/
├── main.dart
├── l10n/                        # Arquivos de tradução (.arb)
└── src/
    ├── core/
    │   ├── app.dart
    │   └── resources/
    │       ├── color_manager.dart
    │       ├── theme_manager.dart
    │       ├── font_manager.dart
    │       ├── style_manager.dart
    │       ├── size_screen_manager.dart
    │       └── locale_controller.dart
    └── features/
        └── portfolio/
            ├── models/
            └── pages/
                ├── main/        # Layout principal, AppBar e Drawer
                ├── home/        # Seção Hero e KPIs
                ├── skills/      # Grade de habilidades
                └── experience/  # Linha do tempo profissional
```

---

## Como Executar

**Pré-requisitos:** Flutter SDK ^3.9.2 instalado.

```bash
# Instalar dependências
flutter pub get

# Gerar arquivos de localização
flutter gen-l10n

# Executar o app
flutter run
```

---

## Idiomas Suportados

| Código | Idioma |
|---|---|
| `pt` | Português (padrão) |
| `en` | Inglês |
| `es` | Espanhol |
| `fr` | Francês |
| `de` | Alemão |
| `it` | Italiano |

---

## Autor

**Davi Cezário Borges** — Desenvolvedor Full Stack

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/davicezario)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/davicezario)
