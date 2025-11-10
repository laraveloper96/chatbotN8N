import 'package:chat_app_n8n/bootstrap.dart';
import 'package:chat_app_n8n/src/features/example/presentation/screens/dio_basic_example_screen.dart';
import 'package:flutter/material.dart';

void main() {
  bootstrap(() => const DioExampleApp());
}

class DioExampleApp extends StatelessWidget {
  const DioExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dio Basic Example',
      debugShowCheckedModeBanner: false,
      home: DioBasicExampleScreen(title: 'Dio Basic Example'),
    );
  }
}
