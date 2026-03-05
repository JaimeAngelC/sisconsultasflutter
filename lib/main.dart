import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sisconsultas/features/auth/presentation/pages/home_page.dart';
import 'package:sisconsultas/features/auth/presentation/pages/login_page.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final auth = ref.watch(authProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: auth.isAuthenticated
          ? const HomePage()
          : const LoginPage(),
    );
  }
}
