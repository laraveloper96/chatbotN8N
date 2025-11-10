import 'package:chat_app_n8n/src/core/core.dart';
import 'package:chat_app_n8n/src/core/shared/shared.dart';
import 'package:chat_app_n8n/src/features/welcome/presentation/widgets/welcome_form.dart';
import 'package:chat_app_n8n/src/features/welcome/presentation/widgets/welcome_header.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.s6),
            child: Column(
              spacing: AppSpacing.s8,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WelcomeHeader(),
                WelcomeForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
