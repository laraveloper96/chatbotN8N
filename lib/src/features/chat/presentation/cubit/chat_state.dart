part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;

  const factory ChatState.loading({required List<MessageEntity> messages}) =
      _Loading;

  const factory ChatState.success({
    required List<MessageEntity> messages,
  }) = _Success;

  const factory ChatState.error({
    required String message,
    required List<MessageEntity> messages,
  }) = _Error;
}
