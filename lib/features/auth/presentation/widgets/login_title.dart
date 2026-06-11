import 'package:flutter/material.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "SISCONSULTAS",
          style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Iniciar Sesión",
          style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
