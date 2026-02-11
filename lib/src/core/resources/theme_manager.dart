import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark, // Definimos como Dark por ser a base do design
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
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
      displayLarge: getBoldStyle(
        fontSize: 48,
        color: ColorManager.textPrimary,
      ).spaceGrotesk,
      headlineMedium: getSemiBoldStyle(
        fontSize: 32,
        color: ColorManager.textPrimary,
      ).spaceGrotesk,
      titleLarge: getMediumStyle(
        fontSize: 20,
        color: ColorManager.textPrimary,
      ).spaceGrotesk,
      // Body: Inter
      bodyLarge: getRegularStyle(
        fontSize: FontSize.s18,
        color: ColorManager.textPrimary,
      ).inter,
      bodyMedium: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.textSecondary,
      ).inter,
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
        textStyle: getSemiBoldStyle(
          fontSize: FontSize.s16,
          color: Colors.white,
        ).inter,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    cardTheme: CardThemeData(
      color: ColorManager.neutral['800'],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
      ),
    ),
  );
}
