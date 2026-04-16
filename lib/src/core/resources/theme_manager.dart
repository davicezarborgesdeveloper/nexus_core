import 'package:flutter/material.dart';
import 'package:nexus_core/src/core/resources/color_manager.dart';
import 'package:nexus_core/src/core/resources/font_manager.dart';
import 'package:nexus_core/src/core/resources/style_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: ColorManager.primary,
      primary: ColorManager.primary,
      onPrimary: ColorManager.accentForeground,
      secondary: ColorManager.accent,
      surface: ColorManager.background,
      onSurface: ColorManager.textPrimary,
      error: ColorManager.error,
    ),
    scaffoldBackgroundColor: ColorManager.background,

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
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.foreground,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: ColorManager.textPrimary),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.accent,
        foregroundColor: ColorManager.accentForeground,
        textStyle: getSemiBoldStyle(
          fontSize: FontSize.s16,
          color: ColorManager.accentForeground,
        ).inter,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    cardTheme: CardThemeData(
      color: ColorManager.background,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: ColorManager.neutral.shade200),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: ColorManager.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorManager.neutral.shade200, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: ColorManager.neutral.shade200, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: ColorManager.primary, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: ColorManager.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: ColorManager.error, width: 1),
      ),
    ),
  );
}
