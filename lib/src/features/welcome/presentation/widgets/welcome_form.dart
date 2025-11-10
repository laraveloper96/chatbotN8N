import 'package:chat_app_n8n/l10n/l10n.dart';
import 'package:chat_app_n8n/src/core/core.dart';
import 'package:chat_app_n8n/src/features/welcome/presentation/widgets/name_input_field.dart';
import 'package:chat_app_n8n/src/features/welcome/presentation/widgets/start_chat_button.dart';
import 'package:flutter/material.dart';

class WelcomeForm extends StatefulWidget {
  const WelcomeForm({super.key});

  @override
  State<WelcomeForm> createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _navigateToChat() {
    if (_nameController.text.trim().isNotEmpty) {
      Navigator.pushNamed(
        context,
        '/chat',
        arguments: _nameController.text.trim(),
      );
      _nameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NameInputField(
            controller: _nameController,
            onSubmitted: _navigateToChat,
          ),
          AppSpacing.vertical.s7,
          StartChatButton(
            onPressed: _navigateToChat,
            label: context.loc.startChatButton,
          ),
        ],
      ),
    );
  }
}
