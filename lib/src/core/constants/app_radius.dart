import 'package:flutter/widgets.dart';

/// Utilidad para estandarizar radios de borde en toda la app.
class AppRadius {
  const AppRadius._();

  /// 0px
  static const double none = 0;

  /// 4px
  static const double r1 = 4;

  /// 8px
  static const double r2 = 8;

  /// 12px
  static const double r3 = 12;

  /// 16px
  static const double r4 = 16;

  /// 18px
  static const double r5 = 18;

  /// 24px
  static const double r6 = 24;

  /// 32px
  static const double r7 = 32;

  /// Provee [BorderRadius] circulares predefinidos.
  static _CircularRadius get circular => const _CircularRadius();
}

class _CircularRadius {
  const _CircularRadius();

  /// Radio circular de 0.
  BorderRadius get none => BorderRadius.circular(AppRadius.none);

  /// Radio circular de 4.
  BorderRadius get r1 => BorderRadius.circular(AppRadius.r1);

  /// Radio circular de 8.
  BorderRadius get r2 => BorderRadius.circular(AppRadius.r2);

  /// Radio circular de 12.
  BorderRadius get r3 => BorderRadius.circular(AppRadius.r3);

  /// Radio circular de 16.
  BorderRadius get r4 => BorderRadius.circular(AppRadius.r4);

  /// Radio circular de 18.
  BorderRadius get r5 => BorderRadius.circular(AppRadius.r5);

  /// Radio circular de 24.
  BorderRadius get r6 => BorderRadius.circular(AppRadius.r6);

  /// Radio circular de 32.
  BorderRadius get r7 => BorderRadius.circular(AppRadius.r7);
}