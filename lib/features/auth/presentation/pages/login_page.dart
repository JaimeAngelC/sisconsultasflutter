import 'package:flutter/material.dart';
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
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleLogin(),
                SizedBox(height: 20),
                TextoUsuario(),
                SizedBox(height: 20),
                TextoContrasena(),
                SizedBox(height: 20),
                BotonAceptar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
