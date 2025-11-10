import 'package:chat_app_n8n/src/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app_n8n/src/features/chat/presentation/cubit/chat_cubit.dart';

extension ChatStateExt on ChatState {
  List<MessageEntity> get messagesByState => maybeWhen(
        loading: (messages) => messages,
        success: (messages) => messages,
        error: (_, messages) => messages,
        orElse: () => [],
      );

  bool get isLoading => maybeWhen(
        loading: (_) => true,
        orElse: () => false,
      );

  bool get isSuccess => maybeWhen(
        success: (_) => true,
        orElse: () => false,
      );
}
