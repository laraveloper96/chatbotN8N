import 'package:chat_app_n8n/l10n/l10n.dart';
import 'package:chat_app_n8n/src/core/core.dart';
import 'package:chat_app_n8n/src/core/shared/shared.dart';
import 'package:chat_app_n8n/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.chat_bubble_outline,
          size: 80,
          color: AppColors.primaryPurple,
        ),
        AppSpacing.vertical.s7,
        Text(
          context.loc.welcomeTitle,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        AppSpacing.vertical.s5,
        Text(
          context.loc.welcomeSubtitle,
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
