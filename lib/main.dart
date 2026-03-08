import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/pages/home_page.dart';
import 'package:sisconsultas/features/auth/presentation/pages/login_page.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
/// Builds a [MaterialApp] that displays either the [HomePage] or [LoginPage]
/// based on whether the user is logged in or not.
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: auth.token != null
          ? const HomePage()
          : const LoginPage(),
    );
  }
}