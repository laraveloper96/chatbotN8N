/// API constants for the Chat App
class ApiConstants {
  ApiConstants._();

  /// Base URL for N8N Webhook
  static const String baseUrl = 'https://n8n-test-n8n.p4zxi4.easypanel.host';

  /// API endpoint for chat bot
  static const String chatEndpoint = '/webhook/chat-bot2';

  /// API timeout configurations
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  static const int sendTimeout = 30000; // 30 seconds

  /// API headers
  /// Default headers for API requests
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Tenant': 'FLUTTER',
  };
}
