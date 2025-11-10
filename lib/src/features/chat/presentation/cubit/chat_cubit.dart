import 'package:chat_app_n8n/src/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app_n8n/src/features/chat/domain/extensions/chat_state_ext.dart';
import 'package:chat_app_n8n/src/features/chat/infrastructure/services/chat_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.chatService}) : super(const ChatState.initial());
  final ChatService chatService;
  List<MessageEntity> _currentMessages = [];

  List<MessageEntity> get messages => _currentMessages;

  Future<void> sendMessage(
      String content, String userName, String sessionId) async {
    final userMessage = MessageEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      isFromUser: true,
      timestamp: DateTime.now(),
    );

    _currentMessages = state.messagesByState;
    emit(
      ChatState.loading(
        messages: [..._currentMessages, userMessage],
      ),
    );

    try {
      final botResponse = await chatService.sendMessage(
        message: content,
        userName: userName,
        sessionId: sessionId,
      );

      emit(
        ChatState.success(
          messages: [..._currentMessages, userMessage, botResponse],
        ),
      );
    } catch (e) {
      emit(
        ChatState.error(
          message: e.toString(),
          messages: [..._currentMessages, userMessage],
        ),
      );
    }
  }
}
