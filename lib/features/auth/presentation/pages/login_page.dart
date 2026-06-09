import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/custom_button.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/custom_password.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/login_title.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();

  @override
  void dispose() {
    usuarioController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if(!formKey.currentState!.validate()) return;
    
    final authProvider = context.read<AuthProvider>();

    final isLogin = await authProvider.login(usuarioController.text, contrasenaController.text);

    if(!mounted) return;

    if(!isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario o contraseña incorrectos"))
      );
    }
  }


  @override
  Widget build(BuildContext context) {    

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                TitleLogin(),
                SizedBox(height: 50),
                CustomTextField(
                  controller: usuarioController,
                  hintText: "Usuario",
                  validator: (value) => value!.isEmpty ? "Ingrese un usuario" : null,
                ),
                SizedBox(height: 20),
                PasswordTexfField(
                  controller: contrasenaController,
                  validator: (value) => value!.isEmpty ? "Ingrese una contraseña" : null,
                ),
                SizedBox(height: 20),
                BotonAceptar(
                  onPressed: login,
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
