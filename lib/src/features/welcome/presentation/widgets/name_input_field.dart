import 'package:chat_app_n8n/l10n/l10n.dart';
import 'package:chat_app_n8n/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

class NameInputField extends StatelessWidget {
  const NameInputField({
    required this.controller,
    required this.onSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: context.loc.nameLabel,
        hintText: context.loc.nameHint,
        prefixIcon: const Icon(
          Icons.person,
          color: AppColors.textSecondary,
        ),
        filled: true,
        fillColor: AppColors.cardBackground,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return context.loc.nameErrorEmpty;
        }
        if (value.trim().length < 2) {
          return context.loc.nameErrorShort;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => onSubmitted(),
    );
  }
}
