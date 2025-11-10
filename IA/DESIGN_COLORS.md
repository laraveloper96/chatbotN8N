# Design Colors - Chat App

Este archivo contiene la paleta de colores extraída del diseño de referencia para la aplicación de chat.

## 🎨 Paleta de Colores Principal

### Colores de Fondo
- **Background Principal**: `#8B5CF6` (Púrpura vibrante)
- **Background Secundario**: `#2D1B69` (Púrpura oscuro)
- **Cards/Containers**: `#1F1B2E` (Gris muy oscuro)
- **Cards Secundarias**: `#2A2438` (Gris oscuro medio)

### Colores de Texto
- **Texto Principal**: `#FFFFFF` (Blanco)
- **Texto Secundario**: `#B8B5C3` (Gris claro)
- **Texto Terciario**: `#6B7280` (Gris medio)
- **Texto Activo**: `#10B981` (Verde para estado activo)

### Colores de Acento
- **Púrpura Primario**: `#8B5CF6` (Color principal de la marca)
- **Púrpura Secundario**: `#7C3AED` (Púrpura más intenso)
- **Púrpura Claro**: `#A78BFA` (Para elementos hover)
- **Púrpura Oscuro**: `#5B21B6` (Para sombras y bordes)

### Colores de Mensajes
- **Mensaje Enviado**: `#8B5CF6` (Púrpura principal)
- **Mensaje Recibido**: `#374151` (Gris oscuro)
- **Burbuja Enviada**: `#7C3AED` (Púrpura más oscuro)
- **Burbuja Recibida**: `#4B5563` (Gris medio oscuro)

### Colores de Estado
- **Online/Activo**: `#10B981` (Verde)
- **Offline**: `#6B7280` (Gris)
- **Notificación**: `#EF4444` (Rojo)
- **Warning**: `#F59E0B` (Amarillo/Naranja)

### Colores de Botones
- **Botón Primario**: `#8B5CF6` (Púrpura principal)
- **Botón Primario Hover**: `#7C3AED` (Púrpura más oscuro)
- **Botón Secundario**: `#374151` (Gris oscuro)
- **Botón Secundario Hover**: `#4B5563` (Gris medio)

### Colores de Bordes y Separadores
- **Border Principal**: `#374151` (Gris oscuro)
- **Border Secundario**: `#4B5563` (Gris medio)
- **Divider**: `#2D3748` (Gris muy oscuro)

## 🔧 Implementación en Flutter

### Definición de Colores en Flutter
```dart
class AppColors {
  // Colores principales
  static const Color primaryPurple = Color(0xFF8B5CF6);
  static const Color secondaryPurple = Color(0xFF7C3AED);
  static const Color lightPurple = Color(0xFFA78BFA);
  static const Color darkPurple = Color(0xFF5B21B6);
  
  // Backgrounds
  static const Color backgroundPrimary = Color(0xFF8B5CF6);
  static const Color backgroundSecondary = Color(0xFF2D1B69);
  static const Color cardBackground = Color(0xFF1F1B2E);
  static const Color cardSecondary = Color(0xFF2A2438);
  
  // Textos
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB8B5C3);
  static const Color textTertiary = Color(0xFF6B7280);
  static const Color textActive = Color(0xFF10B981);
  
  // Mensajes
  static const Color messageSent = Color(0xFF8B5CF6);
  static const Color messageReceived = Color(0xFF374151);
  static const Color bubbleSent = Color(0xFF7C3AED);
  static const Color bubbleReceived = Color(0xFF4B5563);
  
  // Estados
  static const Color statusOnline = Color(0xFF10B981);
  static const Color statusOffline = Color(0xFF6B7280);
  static const Color notification = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  
  // Botones
  static const Color buttonPrimary = Color(0xFF8B5CF6);
  static const Color buttonPrimaryHover = Color(0xFF7C3AED);
  static const Color buttonSecondary = Color(0xFF374151);
  static const Color buttonSecondaryHover = Color(0xFF4B5563);
  
  // Bordes
  static const Color borderPrimary = Color(0xFF374151);
  static const Color borderSecondary = Color(0xFF4B5563);
  static const Color divider = Color(0xFF2D3748);
}
```

### Gradientes
```dart
class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF8B5CF6),
      Color(0xFF7C3AED),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFF8B5CF6),
      Color(0xFF2D1B69),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [
      Color(0xFF1F1B2E),
      Color(0xFF2A2438),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
```

## 📱 Uso Recomendado

### Jerarquía de Colores
1. **Púrpura Principal** (`#8B5CF6`): Elementos principales, botones CTA, mensajes enviados
2. **Púrpura Secundario** (`#7C3AED`): Estados hover, elementos activos
3. **Grises Oscuros** (`#1F1B2E`, `#2A2438`): Backgrounds de cards y containers
4. **Blanco/Grises Claros**: Textos principales y secundarios

### Accesibilidad
- Contraste mínimo de 4.5:1 para texto normal
- Contraste mínimo de 3:1 para texto grande
- Usar colores de estado (verde, rojo) para feedback visual

### Consistencia
- Mantener la paleta limitada a estos colores
- Usar variaciones de opacidad cuando sea necesario
- Aplicar gradientes sutiles para profundidad visual

## 🎯 Elementos del Diseño Identificados

### Pantalla Principal (Home)
- Lista de contactos con avatares circulares
- Estados de conexión (puntos verdes)
- Timestamps en gris claro
- Indicadores de mensajes no leídos (círculos rojos)

### Pantalla de Creación de Grupo
- Cards con bordes redondeados
- Avatares de miembros en círculos
- Botón de acción principal en púrpura
- Tags/chips para categorías

### Pantalla de Chat
- Burbujas de mensaje diferenciadas por color
- Input de texto con iconos
- Indicador de grabación de audio
- Timestamps integrados en las burbujas

---

*Última actualización: Diciembre 2024*
*Diseño de referencia: Chat App UI Kit*