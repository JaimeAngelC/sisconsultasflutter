import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';

class BotonAceptar extends StatelessWidget {
  final VoidCallback onPressed;

  const BotonAceptar({
    super.key, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("Aceptar"),
    );
  }
}
