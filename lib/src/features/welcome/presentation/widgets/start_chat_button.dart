import 'package:chat_app_n8n/src/core/core.dart';
import 'package:chat_app_n8n/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

class StartChatButton extends StatelessWidget {
  const StartChatButton({
    required this.onPressed,
    required this.label,
    super.key,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.primaryGradient,
        borderRadius: AppRadius.circular.r3,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.s5),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.circular.r3,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
