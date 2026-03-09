import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/pages/home_page.dart';
import 'package:sisconsultas/features/auth/presentation/pages/login_page.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';
import 'package:sisconsultas/features/auth/presentation/widgets/auth_wrapper.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthWrapper(),
    );
  }
}