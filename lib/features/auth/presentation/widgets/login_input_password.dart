import 'package:flutter/material.dart';

class TextoContrasena extends StatelessWidget {
  const TextoContrasena({super.key});

  @override
  /// Returns a [TextField] with a decoration set to display a hint text
  /// of "Password", and a white filled background with a teal accent
  /// border when enabled, and a teal accent border when focused.
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.tealAccent),
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        filled: true,
        fillColor: Colors.white,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: EdgeInsets.symmetric(vertical: 18),
      ),
    );
  }
}
