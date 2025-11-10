import 'package:chat_app_n8n/src/core/constants/api_constants.dart';
import 'package:dio/dio.dart';

Future<String> runDioExample({
  String? message,
  String? userName,
}) async {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: ApiConstants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: ApiConstants.receiveTimeout),
      sendTimeout: const Duration(milliseconds: ApiConstants.sendTimeout),
      headers: ApiConstants.defaultHeaders,
    ),
  );

  final user = userName ?? 'DemoUser';
  final chatInput = message ?? 'Hola desde Dio (demo)!';
  final sessionId = '$user-${DateTime.now().millisecondsSinceEpoch}';
  final timestamp = DateTime.now().toIso8601String();

  try {
    final response = await dio.post(
      ApiConstants.chatEndpoint,
      data: {
        'message': chatInput,
        'userName': user,
        'sessionId': sessionId,
        'timestamp': timestamp,
      },
    );

    final buffer = StringBuffer();
    buffer.writeln('Status: ${response.statusCode}');

    final output = (response.data is Map<String, dynamic>)
        ? (response.data['output'] as String?)
        : null;
    if (output != null) {
      buffer.writeln('Bot: "$output"');
    }

    return buffer.toString();
  } on DioException catch (e) {
    return 'DioException: type=${e.type}, message=${e.message}, body=${e.response?.data}';
  } catch (e) {
    return 'Unexpected error: $e';
  }
}
