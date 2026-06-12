import 'package:flutter/material.dart';

class PasswordTexfField extends StatefulWidget {
  final TextEditingController controller;  
  final String? Function(String?) validator;


  const PasswordTexfField({
    super.key, 
    required this.controller, 
    required this.validator
  });

  @override
  State<PasswordTexfField> createState() => _PasswordTexfFieldState();
}

class _PasswordTexfFieldState extends State<PasswordTexfField> {
  bool obscureText = true;

  @override  
  Widget build(BuildContext context) {

    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.tealAccent),
      borderRadius: BorderRadius.circular(10),
    );

    final errorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    );
    
    return TextFormField(
      obscureText: obscureText,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "Password",
        filled: true,
        fillColor: Colors.white,
        enabledBorder: border,
        focusedBorder: border,

        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          color: Colors.grey[700],
          onPressed: () => setState(() => obscureText = !obscureText),
        ),
      ),
    );
  }
}
