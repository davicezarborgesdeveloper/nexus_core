import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xFF1e3a8a); // Identidade principal, títulos importantes, ícones
  static const Color primaryLight = Color(0xFF3b82f6); // Variações, estados hover
  static const Color accent = Color(0xFFf97316); // CTAs, destaques, chamadas para ação
  static const Color accentForeground = Color(0xFFffffff); // Texto sobre botões accent
  static const Color secondary = Color(0xFF475569); // Elementos secundários, texto normal
  static const Color foreground = Color(0xFF0f172a); // Texto principal, conteúdo importante
  static const Color background = Color(0xFFffffff); // Fundo principal do site

  static const Color error = Color(0xFFef4444); // Vermelho vibrante para mensagens de erro, alertas

  static const Color shadow = Color(0xFF000000);

  static const MaterialColor neutral = MaterialColor(0xFF64748b, {
    50: Color(0xFFf8fafc), //TextPrimary-Background sutil
    100: Color(0xFFf1f5f9), //Background seção
    200: Color(0xFFe2e8f0), //Bordas
    300: Color(0xFFcbd5e1), //Bordas hover
    400: Color(0xFF94a3b8), //Texto desabilitado
    500: Color(0xFF64748b), //Texto secundário
    600: Color(0xFF475569), //Texto normal
    700: Color(0xFF334155), //Texto destaque
    800: Color(0xFF1e293b), //surfaceBlue-Texto escuro
    900: Color(0xFF0f172a), //Texto principal
  });

  static const Color textPrimary = foreground;
  static const Color textSecondary = secondary;
}
