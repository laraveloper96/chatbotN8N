import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Gradientes de la aplicación basados en la paleta de colores
/// 
/// Esta clase contiene todos los gradientes utilizados en la aplicación,
/// organizados por categorías y casos de uso específicos.
class AppGradients {
  // Constructor privado para evitar instanciación
  AppGradients._();

  // ========== GRADIENTES PRINCIPALES ==========
  
  /// Gradiente principal púrpura
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      AppColors.primaryPurple,
      AppColors.secondaryPurple,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Gradiente principal invertido
  static const LinearGradient primaryGradientReversed = LinearGradient(
    colors: [
      AppColors.secondaryPurple,
      AppColors.primaryPurple,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ========== GRADIENTES DE FONDO ==========
  
  /// Gradiente de fondo principal
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      AppColors.backgroundPrimary,
      AppColors.backgroundSecondary,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Gradiente de fondo oscuro
  static const LinearGradient darkBackgroundGradient = LinearGradient(
    colors: [
      AppColors.backgroundSecondary,
      AppColors.cardBackground,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ========== GRADIENTES DE CARDS ==========
  
  /// Gradiente para cards principales
  static const LinearGradient cardGradient = LinearGradient(
    colors: [
      AppColors.cardBackground,
      AppColors.cardSecondary,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Gradiente para cards elevadas
  static const LinearGradient elevatedCardGradient = LinearGradient(
    colors: [
      AppColors.cardSecondary,
      AppColors.cardBackground,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ========== GRADIENTES DE BOTONES ==========
  
  /// Gradiente para botón primario
  static const LinearGradient buttonPrimaryGradient = LinearGradient(
    colors: [
      AppColors.buttonPrimary,
      AppColors.buttonPrimaryHover,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Gradiente para botón secundario
  static const LinearGradient buttonSecondaryGradient = LinearGradient(
    colors: [
      AppColors.buttonSecondary,
      AppColors.buttonSecondaryHover,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ========== GRADIENTES DE MENSAJES ==========
  
  /// Gradiente para mensajes enviados
  static const LinearGradient messageSentGradient = LinearGradient(
    colors: [
      AppColors.messageSent,
      AppColors.bubbleSent,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Gradiente para mensajes recibidos
  static const LinearGradient messageReceivedGradient = LinearGradient(
    colors: [
      AppColors.messageReceived,
      AppColors.bubbleReceived,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ========== GRADIENTES ESPECIALES ==========
  
  /// Gradiente de éxito
  static const LinearGradient successGradient = LinearGradient(
    colors: [
      AppColors.success,
      Color(0xFF059669), // Verde más oscuro
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Gradiente de error
  static const LinearGradient errorGradient = LinearGradient(
    colors: [
      AppColors.error,
      Color(0xFFDC2626), // Rojo más oscuro
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Gradiente de advertencia
  static const LinearGradient warningGradient = LinearGradient(
    colors: [
      AppColors.warning,
      Color(0xFFD97706), // Naranja más oscuro
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Gradiente de información
  static const LinearGradient infoGradient = LinearGradient(
    colors: [
      AppColors.info,
      Color(0xFF2563EB), // Azul más oscuro
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ========== GRADIENTES RADIALES ==========
  
  /// Gradiente radial principal
  static const RadialGradient primaryRadialGradient = RadialGradient(
    colors: [
      AppColors.primaryPurple,
      AppColors.darkPurple,
    ],
    center: Alignment.center,
    radius: 1.0,
  );

  /// Gradiente radial para efectos de fondo
  static const RadialGradient backgroundRadialGradient = RadialGradient(
    colors: [
      AppColors.lightPurple,
      AppColors.backgroundSecondary,
    ],
    center: Alignment.topLeft,
    radius: 1.5,
  );

  // ========== GRADIENTES CON TRANSPARENCIA ==========
  
  /// Gradiente con fade out
  static const LinearGradient fadeOutGradient = LinearGradient(
    colors: [
      AppColors.cardBackground,
      Colors.transparent,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Gradiente overlay oscuro
  static const LinearGradient darkOverlayGradient = LinearGradient(
    colors: [
      Colors.transparent,
      Color(0x80000000), // Negro con 50% opacidad
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ========== MÉTODOS DE UTILIDAD ==========
  
  /// Crea un gradiente personalizado con los colores especificados
  static LinearGradient createCustomGradient({
    required List<Color> colors,
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
    List<double>? stops,
  }) {
    return LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
      stops: stops,
    );
  }

  /// Crea un gradiente radial personalizado
  static RadialGradient createCustomRadialGradient({
    required List<Color> colors,
    Alignment center = Alignment.center,
    double radius = 1.0,
    List<double>? stops,
  }) {
    return RadialGradient(
      colors: colors,
      center: center,
      radius: radius,
      stops: stops,
    );
  }

  /// Crea un gradiente con opacidad
  static LinearGradient createGradientWithOpacity({
    required Color color,
    double startOpacity = 1.0,
    double endOpacity = 0.0,
    Alignment begin = Alignment.topCenter,
    Alignment end = Alignment.bottomCenter,
  }) {
    return LinearGradient(
      colors: [
        color.withOpacity(startOpacity),
        color.withOpacity(endOpacity),
      ],
      begin: begin,
      end: end,
    );
  }
}