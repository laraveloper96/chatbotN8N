# 🎯 PRD: Aplicación Demo para Charla "Flutter + n8n"

## 1. Resumen y Visión del Producto
La "aplicación demo" es una app de chat minimalista cuyo propósito es servir como la pieza central de la charla. Su visión es **demostrar de forma clara y en vivo** lo sencillo y potente que es integrar un backend de automatización inteligente (creado en n8n) en una aplicación móvil nativa y fluida (hecha con Flutter). No es un producto comercial, sino una **herramienta educativa**.

---

## 2. El Problema a Resolver
Para muchos desarrolladores de Flutter, la creación de un backend puede ser una tarea compleja, lenta y costosa. Quieren añadir funcionalidades inteligentes como chatbots, pero se enfrentan a:
-   La necesidad de aprender un nuevo lenguaje de backend (Node.js, Python, etc.).
-   La complejidad de gestionar servidores, bases de datos y APIs.
-   La dificultad para iterar y modificar la lógica del bot rápidamente.

Nuestra demo resolverá este problema mostrando una **alternativa viable y rápida** donde la lógica del bot se crea visualmente en n8n y se consume desde Flutter con una simple llamada HTTP.

---

## 3. Público Objetivo (La Audiencia de la Charla)
Nos dirigimos a un público técnico mixto, con dos perfiles principales:

-   **👥 Perfil 1: Desarrollador Principiante - Intermedio**
    -   **Necesidad:** Aprender patrones prácticos y herramientas que aceleren su desarrollo.
    -   **Frustración:** Se siente abrumado por la cantidad de tecnologías necesarias para crear una app completa.
    -   **Objetivo con la demo:** Entender que puede crear una app con un backend inteligente sin ser un experto en DevOps o backend.

-   **👥 Perfil 2: Desarrollador Experto**
    -   **Necesidad:** Evaluar nuevas arquitecturas y herramientas para prototipado rápido y MVPs.
    -   **Frustración:** Pierde tiempo en tareas repetitivas de backend que podrían ser automatizadas.
    -   **Objetivo con la demo:** Validar si la combinación Flutter + n8n es una opción seria para acelerar proyectos y externalizar lógicas de negocio.

---

## 4. Requisitos Funcionales (Features de la Demo)
La aplicación debe ser minimalista para no desviar la atención del objetivo principal.

-   **FR1: Enviar Mensajes de Texto**
    -   **Como** usuario de la app, **quiero** poder escribir texto en un campo y presionar un botón de enviar, **para** iniciar una conversación con el bot.

-   **FR2: Visualizar la Conversación**
    -   **Como** usuario, **quiero** ver mis mensajes y las respuestas del bot en una lista cronológica, **para** poder seguir el hilo de la conversación.

-   **FR3: Mostrar un Estado de "Carga"**
    -   **Como** usuario, **quiero** ver un indicador visual (ej. un `CircularProgressIndicator`), **para** saber que el bot está "pensando" en su respuesta.

-   **FR4: Recibir y Mostrar la Respuesta del Bot**
    -   **Como** usuario, **quiero** que la respuesta del bot aparezca en la lista de mensajes, **para** completar el ciclo de la conversación.

---

## 5. Requisitos No Funcionales
Estos son los atributos de calidad que la demo debe tener para ser efectiva.

-   **✅ Claridad del Código:** El código mostrado debe ser extremadamente simple y legible. La audiencia debe poder seguir la lógica sin esfuerzo.
-   **✅ Rapidez de Respuesta:** La interacción debe sentirse casi instantánea. El workflow de n8n debe ser simple para garantizar una respuesta en menos de 1-2 segundos.
-   **✅ Simplicidad Visual (UI/UX):** La interfaz debe ser limpia, sin elementos distractores. El foco es la interacción, no el diseño.
-   **✅ Fiabilidad a Prueba de Fallos:** La demo debe funcionar sin errores. La conexión (URL del webhook) y el flujo deben estar probados exhaustivamente antes de la charla.
 -   **✅ Internacionalización (l10n):** Soporte para Español e Inglés usando `AppLocalizations`, con claves ARB y acceso mediante `context.loc`.
 -   **✅ Consistencia de Tema:** Paleta de colores y estilos unificados en `AppBar`, `ChatMessages` e `InputMessage`.

---

## 6. Criterios de Éxito de la Demo
El éxito de este "producto" no se mide en descargas, sino en el impacto en la audiencia.

-   **Métrica 1: Comprensión del Concepto:** Al final de la charla, la audiencia puede explicar con sus palabras cómo se conectan Flutter y n8n.
-   **Métrica 2: Calidad de las Preguntas:** La sección de Q&A genera preguntas específicas sobre casos de uso avanzados, escalabilidad o seguridad (indica que entendieron lo básico y están pensando en aplicarlo).
-   **Métrica 3: Inspiración:** Al menos un par de asistentes se acercan después o comentan en redes sociales que "van a probarlo en sus proyectos".
 -   **Métrica 4: Claridad Multilenguaje:** La demo se visualiza correctamente en ES/EN sin textos duros, mostrando títulos y mensajes localizados.

---

## 7. Fuera de Alcance (Lo que NO se construirá)
Para mantener la simplicidad y el enfoque, la demo **NO incluirá**:
-   Autenticación de usuarios.
-   Persistencia del historial de chat (si se cierra la app, la conversación se pierde).
-   Mensajes enriquecidos (imágenes, botones, GIFs).
-   Navegación entre múltiples pantallas.
-   Manejo de conectividad offline.