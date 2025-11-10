import 'package:chat_app_n8n/l10n/l10n.dart';
import 'package:chat_app_n8n/src/core/core.dart';
import 'package:chat_app_n8n/src/core/di/app_modules.dart';
import 'package:chat_app_n8n/src/core/shared/widgets/presentation/background_widget.dart';
import 'package:chat_app_n8n/src/core/theme/theme.dart';
import 'package:chat_app_n8n/src/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:chat_app_n8n/src/features/chat/presentation/widgets/chat_messages.dart';
import 'package:chat_app_n8n/src/features/chat/presentation/widgets/input_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    required this.userName,
    super.key,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatCubit>(
      create: (context) => getIt<ChatCubit>(),
      child: ChatView(userName: userName),
    );
  }
}

class ChatView extends StatefulWidget {
  const ChatView({
    required this.userName,
    super.key,
  });
  final String userName;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late final String _sessionId;

  @override
  void initState() {
    super.initState();
    // Create a unique chat session id when entering the screen
    _sessionId =
        '${widget.userName.trim()}-${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.chatWithUserName(widget.userName),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.secondaryPurple,
        elevation: AppSpacing.none,
        iconTheme: const IconThemeData(
          color: AppColors.textPrimary,
        ),
      ),
      body: BackgroundWidget(
        child: Column(
          children: [
            ChatMessages(userName: widget.userName),
            InputMessage(userName: widget.userName, sessionId: _sessionId),
          ],
        ),
      ),
    );
  }
}
