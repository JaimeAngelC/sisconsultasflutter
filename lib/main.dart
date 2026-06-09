import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/pages/auth_wrapper.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) {
        final authProvider = AuthProvider();
        authProvider.checkLogin();
        return authProvider;
      },
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthWrapper(),
    );
  }
}