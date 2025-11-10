# 📝 TRD para Proyecto: Chat App con n8n (Arquitectura Multi-Feature)

## 1. Objetivo
Este documento define una arquitectura modular y desacoplada para la aplicación **"Chat App con n8n"**. El proyecto se dividirá en dos features independientes, **Welcome** y **Chat**, para maximizar la separación de responsabilidades y la escalabilidad. Se mantiene el stack de **Cubit**, **Services** y **GetIt**.

---

## 2. Arquitectura Multi-Feature
La principal modificación es tratar cada funcionalidad como un módulo aislado dentro del directorio `features`.

-   `lib/src/`: Directorio raíz.
    -   `core/`:
        -   `navigation/`: Crucial para manejar la navegación **entre features**. Define las rutas (ej. `/welcome`, `/chat`) y cómo pasar argumentos entre ellas.
        -   `network/`: Configuración de **Dio**.
    -   `l10n/`: Internacionalización de la app.
        -   `arb/`: Archivos de recursos por idioma (`app_en.arb`, `app_es.arb`).
        -   `l10n.dart`: Exporta `AppLocalizations` y provee extensiones `context.l10n` y `context.loc`.
    -   `features/`:
        -   `welcome/`: **Nueva feature independiente.** Su única responsabilidad es capturar el nombre del usuario.
            -   `presentation/`: Contiene la UI (`welcome_screen.dart`) y su lógica de estado (un `StatefulWidget` o un `WelcomeCubit` simple).
            -   _(Nota: Esta feature es tan simple que probablemente no necesite capas `domain` o `infrastructure`)._
        -   `chat/`: **Feature principal.** Ahora está completamente desacoplada de la lógica de bienvenida.
            -   `domain/`: Contrato `ChatService` y entidades.
            -   `infrastructure/`: Implementación `ChatServiceImpl`.
            -   `presentation/`: Pantalla `ChatScreen` y su `ChatCubit`.
    -   `app/`: Punto de entrada y configuración de **GetIt**.

---

## 3. Stack Tecnológico Aplicado

### 🔹 Cubit
-   **Rol en el proyecto:** Ahora tenemos dos Cubits potenciales, cada uno en su feature:
    -   `WelcomeCubit` (Opcional): Podría manejar el estado del formulario en `WelcomeScreen` (ej. validación de nombre).
    -   `ChatCubit`: Mantiene su rol de gestionar la conversación en `ChatScreen`.
-   **Ubicación:** `features/welcome/presentation/cubit/` y `features/chat/presentation/cubit/`.

### 🔹 Services
-   **Rol en el proyecto:** El `ChatService` y su implementación `ChatServiceImpl` ahora pertenecen exclusivamente a la feature `chat`. No tienen ninguna relación ni conocimiento de la feature `welcome`.
-   **Ubicación:** El contrato en `features/chat/domain/services/` y la implementación en `features/chat/infrastructure/services/`.

### 🔹 GetIt
-   **Rol en el proyecto:** Su configuración en `app/` no cambia. Registrará el `ChatServiceImpl` que será consumido únicamente por el `ChatCubit` dentro de la feature `chat`.

### 🔹 l10n (Internacionalización)
-   **Rol en el proyecto:** Centralizar textos y soportar múltiples idiomas (ES/EN) mediante `AppLocalizations`.
-   **Uso recomendado:** Utilizar `context.loc` (alias de `context.l10n`) en widgets para obtener cadenas localizadas.
-   **Claves principales:** `appTitle`, `welcomeTitle`, `welcomeSubtitle`, `nameLabel`, `nameHint`, `startChatButton`, `nameErrorEmpty`, `nameErrorShort`, `chatWithUserName`, `emptyChatGreeting`, `emptyChatPrompt`, `botTyping`, `composeHint`.
-   **Configuración en `MaterialApp`:** `localizationsDelegates`, `supportedLocales` y `onGenerateTitle: (context) => context.loc.appTitle`.

---

## 4. Flujo de Datos y Navegación Inter-Feature

Este es el nuevo flujo, mostrando cómo las features interactúan a través de la capa de navegación.

1.  **Inicio de la App**: El gestor de rutas en `core/navigation/` establece `/welcome` como la ruta inicial, mostrando la `WelcomeScreen` de la feature `welcome`.

2.  **Feature `welcome`**:
    -   El usuario interactúa con la `WelcomeScreen`.
    -   Al presionar "Comenzar Chat", la capa de presentación de `welcome` **no navega directamente**. En su lugar, llama al servicio de navegación centralizado.
    -   **Ejemplo en `WelcomeScreen`:**
    ```dart
    // Suponiendo un servicio de navegación inyectado o accesible globalmente
    navigationService.navigateTo('/chat', arguments: {'userName': 'ElNombreIngresado'});
    ```

3.  **Navegación (`core/navigation/`)**:
    -   El servicio de navegación recibe la solicitud de ir a la ruta `/chat`.
    -   Resuelve la ruta y construye la `ChatScreen` de la feature `chat`, pasándole el `userName` extraído de los argumentos.

4.  **Feature `chat`**:
    -   La `ChatScreen` se inicializa, recibiendo el `userName` en su constructor, sin saber ni importarle que vino de la feature `welcome`.
    -   A partir de aquí, el flujo interno de la feature `chat` es el mismo que antes: la UI interactúa con el `ChatCubit`, que usa el `ChatService` para comunicarse con n8n, enviando ahora el nombre de usuario que recibió al ser creada.
    -   Los textos de la UI (título, estado vacío, indicador de escritura y placeholder de composición) se obtienen vía `context.loc.*`.

Esta separación asegura que podrías, por ejemplo, eliminar o reemplazar por completo la feature `welcome` sin tener que modificar una sola línea de código dentro de la feature `chat`.