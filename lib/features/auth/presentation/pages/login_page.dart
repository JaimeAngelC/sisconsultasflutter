import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/login_button.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/login_input_password.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/login_input_user.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/login_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {    

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleLogin(),
              TextoUsuario(),
              SizedBox(height: 20),
              TextoContrasena(),
              SizedBox(height: 20),
              BotonAceptar(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget botonAceptar(BuildContext context) {
  final auth = Provider.of<AuthProvider>(context, listen: false);
  return ElevatedButton(
    onPressed: () async {
      final success = await auth.login("5551029", "J5551029");
      if (!context.mounted) return;
      if (!success) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login incorrecto")));
      }
    },
    child: const Text("Aceptar"),
  );
}
