import 'package:flutter/material.dart';

/// Configuração visual do [LoginPage].
///
/// Todos os campos são opcionais. Quando não informados, o módulo
/// usa os valores do [ThemeData] do app via [Theme.of(context)].
///
/// Exemplo:
/// ```dart
/// LoginModule(
///   repository: MyRepository(),
///   theme: LoginTheme(
///     primaryColor: Color(0xFF6C3483),
///     backgroundColor: Color(0xFFF5F5F5),
///     backgroundImage: DecorationImage(
///       image: AssetImage('assets/images/bg_login.png'),
///       fit: BoxFit.cover,
///     ),
///     titleFontFamily: 'Poppins',
///     bodyFontFamily: 'Roboto',
///     logo: Image.asset('assets/images/logo.png', height: 56),
///   ),
/// )
/// ```
class LoginTheme {
  /// Cor principal: botão, bordas de foco, container do logo.
  /// Padrão: [ColorScheme.primary] do tema do app.
  final Color? primaryColor;

  /// Cor de fundo da página.
  /// Padrão: [Colors.white].
  final Color backgroundColor;

  /// Imagem de fundo da página (opcional).
  final DecorationImage? backgroundImage;

  /// Fonte dos títulos (ex: 'Poppins', 'Montserrat').
  /// Padrão: 'Space Grotesk'.
  final String? titleFontFamily;

  /// Fonte do corpo, labels e hints (ex: 'Roboto', 'Lato').
  /// Padrão: 'Inter'.
  final String? bodyFontFamily;

  /// Widget exibido no topo do card, no lugar do ícone padrão.
  /// Use para colocar o logo da sua aplicação.
  final Widget? logo;

  const LoginTheme({
    this.primaryColor,
    this.backgroundColor = Colors.white,
    this.backgroundImage,
    this.titleFontFamily,
    this.bodyFontFamily,
    this.logo,
  });
}
