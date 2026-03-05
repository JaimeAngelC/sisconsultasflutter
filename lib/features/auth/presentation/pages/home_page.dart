import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      body: Center(
        child: Text(
          "Bienvenido ${auth.username}",
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}