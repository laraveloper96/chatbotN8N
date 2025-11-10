import 'package:chat_app_n8n/l10n/l10n.dart';
import 'package:chat_app_n8n/src/core/core.dart';
import 'package:chat_app_n8n/src/core/theme/theme.dart';
import 'package:chat_app_n8n/src/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputMessage extends StatefulWidget {
  const InputMessage({
    required this.userName,
    required this.sessionId,
    super.key,
  });
  final String userName;
  final String sessionId;

  @override
  State<InputMessage> createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final cleanMessage = _messageController.text.trim();
    if (cleanMessage.isNotEmpty) {
      context
          .read<ChatCubit>()
          .sendMessage(cleanMessage, widget.userName, widget.sessionId);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _BackgroundInputWidget(
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: context.loc.composeHint,
                  hintStyle: const TextStyle(color: AppColors.textSecondary),
                  border: OutlineInputBorder(
                    borderRadius: AppRadius.circular.r6,
                    borderSide: BorderSide(
                      color: AppColors.textSecondary.withValues(alpha: 0.3),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: AppRadius.circular.r6,
                    borderSide:
                        const BorderSide(color: AppColors.primaryPurple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s4,
                    vertical: AppSpacing.s3,
                  ),
                  fillColor: AppColors.cardSecondary,
                  filled: true,
                ),
                textInputAction: TextInputAction.send,
                onSubmitted: (value) => _sendMessage(),
              ),
            ),
            AppSpacing.horizontal.s4,
            Container(
              decoration: const BoxDecoration(
                gradient: AppGradients.primaryGradient,
                shape: BoxShape.circle,
              ),
              child: FloatingActionButton(
                onPressed: _sendMessage,
                backgroundColor: Colors.transparent,
                elevation: AppSpacing.none,
                mini: true,
                child: const Icon(
                  Icons.send,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundInputWidget extends StatelessWidget {
  const _BackgroundInputWidget({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(AppSpacing.s5).copyWith(bottom: AppSpacing.s3),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: AppColors.textSecondary.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: child,
    );
  }
}
