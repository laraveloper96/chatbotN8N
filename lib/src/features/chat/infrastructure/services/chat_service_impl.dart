import 'package:chat_app_n8n/src/core/constants/api_constants.dart';
import 'package:chat_app_n8n/src/core/network/dio_client.dart';
import 'package:chat_app_n8n/src/features/chat/domain/entities/message_entity.dart';
import 'package:chat_app_n8n/src/features/chat/infrastructure/services/chat_service.dart';
import 'package:dio/dio.dart';

class ChatServiceImpl implements ChatService {
  ChatServiceImpl({required this.dio});
  final DioClient dio;

  @override
  Future<MessageEntity> sendMessage({
    required String message,
    required String userName,
    required String sessionId,
  }) async {
    try {
      final response = await dio.post(
        ApiConstants.chatEndpoint,
        data: {
          'message': message,
          'userName': userName,
          'sessionId': sessionId,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      // Simular respuesta del bot si n8n no está disponible
      if (response.statusCode == 200) {
        final botResponse = response.data['output'] as String? ??
            'Ups, algo salió mal. Por favor, intenta de nuevo.';

        return MessageEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: botResponse,
          isFromUser: false,
          timestamp: DateTime.now(),
        );
      } else {
        throw Exception('Error en la respuesta del servidor');
      }
    } on DioException catch (e) {
      return MessageEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: 'Ups, algo salió mal. Por favor, intenta de nuevo.',
        isFromUser: false,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }
}
