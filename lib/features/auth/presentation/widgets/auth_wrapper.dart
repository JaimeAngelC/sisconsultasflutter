import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/pages/home_page.dart';
import 'package:sisconsultas/features/auth/presentation/pages/login_page.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {

    final auth = context.read<AuthProvider>();

    await auth.isLoggedIn();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final auth = context.watch<AuthProvider>(); // 👈 escucha cambios

    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (auth.token != null) {
      return const HomePage();
    }

    return const LoginPage();
  }
}