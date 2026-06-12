import 'package:flutter/material.dart';

class BotonAceptar extends StatelessWidget {
  final VoidCallback onPressed;

  const BotonAceptar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2DAA44),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text("Ingresar"),
      ),
    );
  }
}
