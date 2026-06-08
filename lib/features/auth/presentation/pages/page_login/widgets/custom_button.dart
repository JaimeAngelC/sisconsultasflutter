import 'package:flutter/material.dart';

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
