import 'package:chat_app_n8n/src/features/chat/presentation/screens/chat_screen.dart';
import 'package:chat_app_n8n/src/features/welcome/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String welcome = '/';
  static const String chat = '/chat';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case chat:
        final userName = settings.arguments as String? ?? 'Usuario';
        return MaterialPageRoute(
          builder: (_) => ChatScreen(userName: userName),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Ruta no encontrada'),
            ),
          ),
        );
    }
  }
}
