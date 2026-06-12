import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/custom_button.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/custom_password.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/login_title.dart';
import 'package:sisconsultas/responsive/responsive.dart';

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
    if (!formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();

    final isLogin = await authProvider.login1(
      usuarioController.text,
      contrasenaController.text,
    );

    if (!mounted) return;

    if (!isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario o contraseña incorrectos")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF061333),
      body: ResponsiveContainer(
        child: Container(
          width: 360,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color(0xFF2B3350),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue, width: 0.8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 4.0), //(x,y)
                blurRadius: 10.0,
              ),
            ],
          ),

          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', width: 100),

                SizedBox(height: 20),

                TitleLogin(),
                SizedBox(height: 20),
                CustomTextField(
                  controller: usuarioController,
                  hintText: "Usuario",
                  validator: (value) =>
                      value!.isEmpty ? "Ingrese un usuario" : null,
                ),
                SizedBox(height: 20),
                PasswordTexfField(
                  controller: contrasenaController,
                  validator: (value) =>
                      value!.isEmpty ? "Ingrese una contraseña" : null,
                ),
                SizedBox(height: 25),                
                BotonAceptar(onPressed: login), 
                SizedBox(height: 20),
                Text(
                    'Versión 2.0.0',
                    style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                ),
              ),              
                         
              ],
            ),
          ),
        ),
      ),
    );
  }
}
