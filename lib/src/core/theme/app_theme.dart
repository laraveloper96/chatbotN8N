import 'package:chat_app_n8n/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Tema principal de la aplicación
///
/// Esta clase define el tema completo de la aplicación utilizando
/// la paleta de colores y gradientes definidos.
class AppTheme {
  // Constructor privado para evitar instanciación
  AppTheme._();

  /// Tema principal de la aplicación
  static ThemeData get theme {
    return ThemeData(
      // ========== CONFIGURACIÓN BÁSICA ==========
      useMaterial3: true,
      brightness: Brightness.dark,
      // Extensiones del tema (colores de chat)
      extensions: <ThemeExtension<dynamic>>[
        AppTheme.chatExtension,
      ],

      // ========== ESQUEMA DE COLORES ==========
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryPurple,
        primaryContainer: AppColors.darkPurple,
        secondary: AppColors.secondaryPurple,
        secondaryContainer: AppColors.lightPurple,
        surface: AppColors.cardBackground,
        surfaceContainerHighest: AppColors.cardSecondary,
        error: AppColors.error,
        onPrimary: AppColors.textPrimary,
        onSecondary: AppColors.textPrimary,
        onError: AppColors.textPrimary,
        outline: AppColors.borderPrimary,
        outlineVariant: AppColors.borderSecondary,
      ),

      // ========== SCAFFOLD ==========
      scaffoldBackgroundColor: AppColors.backgroundSecondary,

      // ========== APP BAR ==========
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(
          color: AppColors.textPrimary,
          size: 24,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),

      // ========== BOTONES ==========
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryPurple,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(
            color: AppColors.borderPrimary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // ========== FLOATING ACTION BUTTON ==========
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: AppColors.textPrimary,
        elevation: 4,
        shape: CircleBorder(),
      ),

      // ========== CARDS ==========
      cardTheme: CardTheme(
        color: AppColors.cardBackground,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: AppColors.borderSecondary,
            width: 0.5,
          ),
        ),
        margin: const EdgeInsets.all(8),
      ),

      // ========== INPUTS ==========
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.borderPrimary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.borderSecondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryPurple,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: const TextStyle(
          color: AppColors.textTertiary,
          fontSize: 16,
        ),
        labelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
        ),
      ),

      // ========== TEXTO ==========
      textTheme: const TextTheme(
        // Headlines
        headlineLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        headlineSmall: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),

        // Titles
        titleLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ),
        titleMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        titleSmall: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),

        // Body
        bodyLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          color: AppColors.textTertiary,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),

        // Labels
        labelLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ),
        labelMedium: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
        labelSmall: TextStyle(
          color: AppColors.textTertiary,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
      ),

      // ========== ICONOS ==========
      iconTheme: const IconThemeData(
        color: AppColors.textSecondary,
        size: 24,
      ),

      // ========== DIVISORES ==========
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // ========== CHIPS ==========
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.cardSecondary,
        selectedColor: AppColors.primaryPurple,
        disabledColor: AppColors.borderSecondary,
        labelStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        secondaryLabelStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: const BorderSide(
          color: AppColors.borderSecondary,
        ),
      ),

      // ========== BOTTOM NAVIGATION BAR ==========
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.primaryPurple,
        unselectedItemColor: AppColors.textTertiary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      // ========== SNACK BAR ==========
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.cardBackground,
        contentTextStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),

      // ========== DIALOG ==========
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.cardBackground,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        titleTextStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
        ),
      ),

      // ========== BOTTOM SHEET ==========
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.cardBackground,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),
    );
  }

  // ========== EXTENSIONES DE TEMA ==========

  /// Extensión para colores personalizados
  static ThemeExtension<ChatThemeExtension> get chatExtension {
    return const ChatThemeExtension(
      messageSentColor: AppColors.messageSent,
      messageReceivedColor: AppColors.messageReceived,
      bubbleSentColor: AppColors.bubbleSent,
      bubbleReceivedColor: AppColors.bubbleReceived,
      onlineStatusColor: AppColors.statusOnline,
      offlineStatusColor: AppColors.statusOffline,
      notificationColor: AppColors.notification,
      warningColor: AppColors.warning,
    );
  }
}

/// Extensión de tema personalizada para el chat
@immutable
class ChatThemeExtension extends ThemeExtension<ChatThemeExtension> {
  const ChatThemeExtension({
    required this.messageSentColor,
    required this.messageReceivedColor,
    required this.bubbleSentColor,
    required this.bubbleReceivedColor,
    required this.onlineStatusColor,
    required this.offlineStatusColor,
    required this.notificationColor,
    required this.warningColor,
  });

  final Color messageSentColor;
  final Color messageReceivedColor;
  final Color bubbleSentColor;
  final Color bubbleReceivedColor;
  final Color onlineStatusColor;
  final Color offlineStatusColor;
  final Color notificationColor;
  final Color warningColor;

  @override
  ChatThemeExtension copyWith({
    Color? messageSentColor,
    Color? messageReceivedColor,
    Color? bubbleSentColor,
    Color? bubbleReceivedColor,
    Color? onlineStatusColor,
    Color? offlineStatusColor,
    Color? notificationColor,
    Color? warningColor,
  }) {
    return ChatThemeExtension(
      messageSentColor: messageSentColor ?? this.messageSentColor,
      messageReceivedColor: messageReceivedColor ?? this.messageReceivedColor,
      bubbleSentColor: bubbleSentColor ?? this.bubbleSentColor,
      bubbleReceivedColor: bubbleReceivedColor ?? this.bubbleReceivedColor,
      onlineStatusColor: onlineStatusColor ?? this.onlineStatusColor,
      offlineStatusColor: offlineStatusColor ?? this.offlineStatusColor,
      notificationColor: notificationColor ?? this.notificationColor,
      warningColor: warningColor ?? this.warningColor,
    );
  }

  @override
  ChatThemeExtension lerp(ThemeExtension<ChatThemeExtension>? other, double t) {
    if (other is! ChatThemeExtension) {
      return this;
    }
    return ChatThemeExtension(
      messageSentColor:
          Color.lerp(messageSentColor, other.messageSentColor, t)!,
      messageReceivedColor:
          Color.lerp(messageReceivedColor, other.messageReceivedColor, t)!,
      bubbleSentColor: Color.lerp(bubbleSentColor, other.bubbleSentColor, t)!,
      bubbleReceivedColor:
          Color.lerp(bubbleReceivedColor, other.bubbleReceivedColor, t)!,
      onlineStatusColor:
          Color.lerp(onlineStatusColor, other.onlineStatusColor, t)!,
      offlineStatusColor:
          Color.lerp(offlineStatusColor, other.offlineStatusColor, t)!,
      notificationColor:
          Color.lerp(notificationColor, other.notificationColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
    );
  }
}
