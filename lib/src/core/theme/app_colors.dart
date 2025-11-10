import 'package:flutter/material.dart';

/// Globant Color Palette for Flutter
///
/// Private palette used as the source for `AppColors`.
/// Keeps constants immutable and centralizes brand values.
class _PaletteColors {
  // Color principal - Verde Globant
  static const Color primary = Color(0xFFB4D92E); // Verde lima brillante
  static const Color primaryDark = Color(0xFF8FB825);
  static const Color primaryLight = Color(0xFFC8E65C);

  // Colores secundarios
  static const Color secondary = Color(0xFF000000); // Negro
  static const Color secondaryLight = Color(0xFF1A1A1A);

  // Colores de acento
  static const Color accent = Color(0xFFFFFFFF); // Blanco
  static const Color accentGray = Color(0xFFF5F5F5);

  // Colores de texto
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textOnPrimary = Color(0xFF000000); // Texto sobre verde
  static const Color textOnDark = Color(0xFFFFFFFF);

  // Colores de fondo
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF000000);
  static const Color backgroundGray = Color(0xFFF5F5F5);

  // Colores de superficie
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1A1A1A);
}

/// Application Color Palette (using Globant palette)
///
/// Exposes all colors used across the app. It maps to
/// `_PaletteColors` so existing `AppColors` references remain valid
/// while adopting Globant brand colors. All values are constant.
class AppColors {
  // Constructor privado para evitar instanciación
  AppColors._();

  // ========== PRIMARY BRAND COLORS ==========

  /// Color púrpura principal de la marca
  static const Color primaryPurple = _PaletteColors.primary;

  /// Color púrpura secundario más intenso
  static const Color secondaryPurple = _PaletteColors.primaryDark;

  /// Color púrpura claro para elementos hover
  static const Color lightPurple = _PaletteColors.primaryLight;

  /// Color púrpura oscuro para sombras y bordes
  static const Color darkPurple = _PaletteColors.secondaryLight;

  // ========== BACKGROUND COLORS ==========

  /// Background principal - púrpura vibrante
  static const Color backgroundPrimary = _PaletteColors.secondaryLight;

  /// Background secundario - púrpura oscuro
  static const Color backgroundSecondary = _PaletteColors.backgroundDark;

  /// Background para cards y containers principales
  static const Color cardBackground = _PaletteColors.surfaceDark;

  /// Background para cards secundarias
  static const Color cardSecondary = _PaletteColors.secondaryLight;

  // ========== TEXT COLORS ==========

  /// Texto principal - blanco
  static const Color textPrimary = _PaletteColors.textOnDark;

  /// Texto secundario - gris claro
  static const Color textSecondary = _PaletteColors.accentGray;

  /// Texto terciario - gris medio
  static const Color textTertiary = _PaletteColors.textSecondary;

  /// Texto activo - verde para estado activo
  static const Color textActive = _PaletteColors.primary;

  // ========== MESSAGE COLORS ==========

  /// Color para mensajes enviados
  static const Color messageSent = _PaletteColors.primary;

  /// Color para mensajes recibidos
  static const Color messageReceived = _PaletteColors.secondaryLight;

  /// Color para burbujas de mensajes enviados
  static const Color bubbleSent = _PaletteColors.primaryDark;

  /// Color para burbujas de mensajes recibidos
  static const Color bubbleReceived = _PaletteColors.surfaceDark;

  // ========== STATUS COLORS ==========

  /// Color para estado online/activo
  static const Color statusOnline = Color(0xFF10B981);

  /// Color para estado offline
  static const Color statusOffline = Color(0xFF6B7280);

  /// Color para notificaciones
  static const Color notification = Color(0xFFEF4444);

  /// Color para advertencias
  static const Color warning = Color(0xFFF59E0B);

  // ========== BUTTON COLORS ==========

  /// Color primario para botones
  static const Color buttonPrimary = _PaletteColors.primary;

  /// Color primario hover para botones
  static const Color buttonPrimaryHover = _PaletteColors.primaryDark;

  /// Color secundario para botones
  static const Color buttonSecondary = _PaletteColors.secondaryLight;

  /// Color secundario hover para botones
  static const Color buttonSecondaryHover = _PaletteColors.surfaceDark;

  // ========== BORDERS AND DIVIDERS ==========

  /// Border principal
  static const Color borderPrimary = _PaletteColors.secondaryLight;

  /// Border secundario
  static const Color borderSecondary = _PaletteColors.accentGray;

  /// Color para divisores
  static const Color divider = _PaletteColors.surfaceDark;

  // ========== ADDITIONAL COLORS ==========

  /// Color de superficie para elementos elevados
  static const Color surface = _PaletteColors.surfaceDark;

  /// Color de superficie variante
  static const Color surfaceVariant = _PaletteColors.secondaryLight;

  /// Color de error
  static const Color error = Color(0xFFEF4444);

  /// Color de éxito
  static const Color success = Color(0xFF10B981);

  /// Color de información
  static const Color info = Color(0xFF3B82F6);

  // ========== UTILITY METHODS ==========

  /// Obtiene una versión más clara del color
  static Color lighten(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Obtiene una versión más oscura del color
  static Color darken(Color color, [double amount = 0.1]) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}
