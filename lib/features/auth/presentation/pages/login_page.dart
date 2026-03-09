import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final success = await auth.login("5551029", "J5551029");
            if (!context.mounted) return;

          if (!success) {
            ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login incorrecto")),
            );
          }

          },
          child: const Text("Aceptar"),
        ),
      ),
    );
  }
}