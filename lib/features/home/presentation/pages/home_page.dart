import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';
import 'package:sisconsultas/features/home/presentation/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final auth = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: Color(0xFF061333),
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: Color(0xFF061333),
        foregroundColor: Colors.white,
        ),

        drawer: Drawer(
          backgroundColor: const Color(0xFF2B3350),
          child: AppDrawerContent(
            name: auth.username?? "",
            email: auth.email?? ""
          ),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
              Text(
                "Bienvenido ${auth.username}",
                style: const TextStyle(fontSize: 22, color: Colors.white),
                
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