import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/pages/page_home/home_page.dart';
import 'package:sisconsultas/features/auth/presentation/pages/page_login/login_page.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    switch (auth.status) {
      case AuthStatus.loading:
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      case AuthStatus.notAutenticated:
        return const LoginPage();
      case AuthStatus.autenticated:
        return const HomePage();
    }
  }
}
