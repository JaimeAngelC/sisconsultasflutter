import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
              Text(
                "Bienvenido ${auth.username}",
                style: const TextStyle(fontSize: 22),
              ),
              ElevatedButton(
                onPressed: () async {
                  await auth.logout();
                 },
                child: const Text("Cerrar sesión"),
              ),
            
          ],
        ),
      ),
    );
  }
}