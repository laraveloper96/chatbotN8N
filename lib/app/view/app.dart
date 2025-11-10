import 'package:chat_app_n8n/l10n/l10n.dart';
import 'package:chat_app_n8n/src/core/di/app_modules.dart';
import 'package:chat_app_n8n/src/core/navigation/router.dart';
import 'package:chat_app_n8n/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  void initState() {
    AppModules.initializeDependencies();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => context.loc.appTitle,
      theme: AppTheme.theme,
      initialRoute: AppRouter.welcome,
      onGenerateRoute: AppRouter.generateRoute,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
