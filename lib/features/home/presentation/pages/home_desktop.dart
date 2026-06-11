import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';
import 'package:sisconsultas/features/home/presentation/widgets/custom_drawer.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Row(
        children: [
          Container(
            width: 250,            
            color: Colors.white,
            child: AppDrawerContent(
              name: auth.username?? "", 
              email: auth.email?? ""
            ),
          ),
          Expanded(
            child: Center(
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
              )
          ),
        
      ])
    );
  }
}