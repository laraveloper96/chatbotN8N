import 'package:chat_app_n8n/src/features/example/infrastructure/dio_basic_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DioBasicExampleScreen extends StatefulWidget {
  const DioBasicExampleScreen({required this.title, super.key});
  final String title;

  @override
  State<DioBasicExampleScreen> createState() => _DioBasicExampleScreenState();
}

class _DioBasicExampleScreenState extends State<DioBasicExampleScreen> {
  final _userController = TextEditingController(text: 'Laraveloper');
  final _messageController = TextEditingController(text: 'Hola');

  String _result = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _run() async {
    setState(() => _isLoading = true);

    final res = await runDioExample(
      message: _messageController.text.trim().isEmpty
          ? null
          : _messageController.text.trim(),
      userName: _userController.text.trim().isEmpty
          ? null
          : _userController.text.trim(),
    );

    if (mounted) {
      setState(() {
        _result = res;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo Dio Básico')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _CardForm(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enviar mensaje al webhook (n8n) usando Dio',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _messageController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _isLoading ? null : _run(),
                    decoration: const InputDecoration(
                      labelText: 'Mensaje',
                      hintText: 'Escribe el mensaje a enviar',
                      prefixIcon: Icon(Icons.message_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      labelText: 'Usuario',
                      hintText: 'Nombre de usuario',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      FilledButton.icon(
                        onPressed: _isLoading ? null : _run,
                        icon: _isLoading
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.send),
                        label: const Text('Enviar'),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: _isLoading
                            ? null
                            : () {
                                setState(() {
                                  _result = '';
                                });
                              },
                        icon: const Icon(Icons.clear),
                        label: const Text('Limpiar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _CardForm(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Resultado',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextButton.icon(
                        onPressed: _result.isEmpty
                            ? null
                            : () async {
                                await Clipboard.setData(
                                  ClipboardData(text: _result),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        'Resultado copiado al portapapeles',
                                      ),
                                      backgroundColor: color.primary,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
                              },
                        icon: const Icon(Icons.copy),
                        label: const Text('Copiar'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.surface,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      child: SelectableText(
                        _result.isEmpty ? 'Sin datos todavía.' : _result,
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardForm extends StatelessWidget {
  const _CardForm({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
