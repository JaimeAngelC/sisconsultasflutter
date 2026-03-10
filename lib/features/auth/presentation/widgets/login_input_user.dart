import 'package:flutter/material.dart';

class TextoUsuario extends StatelessWidget {
  const TextoUsuario({super.key});

  @override
  /// Returns a [TextField] with a decoration set to display a hint text
  /// of "Usuario", and a white filled background with a teal accent
  /// border when enabled, and a teal accent border when focused.
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.tealAccent),
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
      decoration: InputDecoration(
        hintText: "Usuario",
        filled: true,
        fillColor: Colors.white,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: EdgeInsets.symmetric(vertical: 18),
      ),
    );
  }
}
