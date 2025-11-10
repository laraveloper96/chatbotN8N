import 'package:chat_app_n8n/src/core/network/dio_client.dart';
import 'package:chat_app_n8n/src/features/chat/infrastructure/services/chat_service.dart';
import 'package:chat_app_n8n/src/features/chat/infrastructure/services/chat_service_impl.dart';
import 'package:chat_app_n8n/src/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class AppModules {
  static void initializeDependencies() {
    _setupMainModule();
    _setupBlocModule();
    _setupServiceModule();
    _setupPreferencesModule();
  }

  static void _setupMainModule() {
    getIt
      ..registerLazySingleton(Dio.new)
      ..registerSingleton(DioClient(getIt.get()));
  }

  static void _setupBlocModule() {
    getIt.registerFactory(
      () => ChatCubit(chatService: getIt.get<ChatService>()),
    );
  }

  static void _setupServiceModule() {
    getIt.registerFactory<ChatService>(
      () => ChatServiceImpl(dio: getIt.get<DioClient>()),
    );
  }

  static void _setupPreferencesModule() {
    // TODO: Register SharedPreferences instance
  }
}
