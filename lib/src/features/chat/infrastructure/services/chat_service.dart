import 'package:chat_app_n8n/src/features/chat/domain/entities/message_entity.dart';

abstract class ChatService {
  Future<MessageEntity> sendMessage({
    required String message,
    required String userName,
    required String sessionId,
  });
}
