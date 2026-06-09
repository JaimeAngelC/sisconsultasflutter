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
      appBar: AppBar(
        title: const Text("Inicio")
        ),

        drawer: AppDrawer(
          name: auth.username?? "",
          email: auth.email?? "",
          
        ),
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