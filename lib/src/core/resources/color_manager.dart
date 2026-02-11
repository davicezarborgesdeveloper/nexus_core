import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(
    0xFF1e3a8a,
  ); // Identidade principal, títulos importantes, ícones
  static Color primaryLight = const Color(
    0xFF3b82f6,
  ); //Uso: Variações, estados hover
  static Color accent = const Color(
    0xFFf97316,
  ); //vibrant coral-CTAs, destaques, chamadas para ação
  static Color secondary = const Color(
    0xFF475569,
  ); //Elementos secundários, texto normal
  static Color foreground = const Color(
    0xFF0f172a,
  ); //deepBlue-Texto principal, conteúdo importante
  static Color background = const Color(
    0xFFffffff,
  ); //Texto principal, conteúdo importante

  static final Map<String, Color> neutral = {
    '50': const Color(0xFFf8fafc), //TextPrimary-Background sutil
    '100': const Color(0xFFf1f5f9), //Background seção
    '200': const Color(0xFFe2e8f0), //Bordas
    '300': const Color(0xFFcbd5e1), //Bordas hover
    '400': const Color(0xFF94a3b8), //Texto desabilitado
    '500': const Color(0xFF64748b), //Texto secundário
    '600': const Color(0xFF475569), //Texto normal
    '700': const Color(0xFF334155), //Texto destaque
    '800': const Color(0xFF1e293b), //surfaceBlue-Texto escuro
    '900': const Color(0xFF0f172a), //Texto principal
  };

  static Color textPrimary = neutral['50']!;
  static Color textSecondary = neutral['400']!;
}
