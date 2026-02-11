import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark, // Definimos como Dark por ser a base do design
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.accent,
      primary: ColorManager.accent,
      onPrimary: Colors.white,
      secondary: ColorManager.accent,
      surface: ColorManager.foreground,
      onSurface: ColorManager.textPrimary,
      error: Colors.redAccent,
    ),
    scaffoldBackgroundColor: ColorManager.foreground,

    // Tipografia
    textTheme: TextTheme(
      // Headings: Space Grotesk
      displayLarge: GoogleFonts.spaceGrotesk(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: ColorManager.textPrimary,
      ),
      headlineMedium: GoogleFonts.spaceGrotesk(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: ColorManager.textPrimary,
      ),
      titleLarge: GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorManager.textPrimary,
      ),
      // Body: Inter
      bodyLarge: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: ColorManager.textPrimary,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: ColorManager.textSecondary,
      ),
    ),

    // Customização de Componentes
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.foreground,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: ColorManager.textPrimary),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.accent,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    cardTheme: CardTheme(
      color: ColorManager.neutral['800'],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
      ),
    ),
  );
}
