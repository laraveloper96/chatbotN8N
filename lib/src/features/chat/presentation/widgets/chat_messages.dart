import 'package:chat_app_n8n/l10n/l10n.dart';
import 'package:chat_app_n8n/src/core/core.dart';
import 'package:chat_app_n8n/src/core/shared/shared.dart';
import 'package:chat_app_n8n/src/core/theme/theme.dart';
import 'package:chat_app_n8n/src/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app_n8n/src/features/chat/domain/extensions/chat_state_ext.dart';
import 'package:chat_app_n8n/src/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({required this.userName, super.key});
  final String userName;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  final ScrollController _scrollController = ScrollController();

  static const int animationDuration = 300;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: animationDuration),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state.isSuccess) {
          _scrollToBottom();
        }
      },
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          var messages = <MessageEntity>[];
          var isLoading = false;
          isLoading = state.isLoading;
          messages = state.messagesByState;

          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: messages.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.chat_bubble_outline,
                                size: AppSize.xxl,
                                color: AppColors.textSecondary,
                              ),
                              AppSpacing.vertical.s5,
                              Text(
                                context.loc.emptyChatGreeting(widget.userName),
                                style:
                                    context.textTheme.headlineSmall?.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              AppSpacing.vertical.s3,
                              Text(
                                context.loc.emptyChatPrompt,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.all(AppSpacing.s5),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            return _MessageBubble(message: message);
                          },
                        ),
                ),
                if (isLoading)
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.s5),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: AppSpacing.s4,
                          height: AppSpacing.s4,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryPurple,
                            ),
                          ),
                        ),
                        AppSpacing.horizontal.s4,
                        Text(
                          context.loc.botTyping,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});
  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    final chatTheme = Theme.of(context).extension<ChatThemeExtension>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: message.isFromUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isFromUser) ...[
            const CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.cardBackground,
              child: Icon(
                Icons.smart_toy,
                size: AppSize.sm,
                color: AppColors.primaryPurple,
              ),
            ),
            AppSpacing.horizontal.s3,
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: message.isFromUser
                    ? chatTheme?.bubbleSentColor ?? AppColors.primaryPurple
                    : chatTheme?.bubbleReceivedColor ??
                        AppColors.cardBackground,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppColors.borderSecondary,
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: (message.isFromUser
                            ? AppColors.primaryPurple
                            : AppColors.textSecondary)
                        .withValues(alpha: 0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTime(message.timestamp),
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: message.isFromUser
                          ? AppColors.textSecondary.withValues(alpha: 0.8)
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (message.isFromUser) ...[
            AppSpacing.horizontal.s3,
            CircleAvatar(
              radius: AppRadius.r4,
              backgroundColor: AppColors.primaryPurple.withValues(alpha: 0.2),
              child: const Icon(
                Icons.person,
                size: AppSize.sm,
                color: AppColors.primaryPurple,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}
