import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;


  const CustomTextField({
    super.key, 
    required this.controller, 
    required this.hintText,    
    this.validator});

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
      controller: controller,      
      validator: validator,
      decoration: InputDecoration(  
        filled: true,
        fillColor: Colors.white,      
        hintText: hintText,
        enabledBorder: border,
        focusedBorder: border,
        
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,

        contentPadding: EdgeInsets.symmetric(vertical: 18),
        prefixIcon: Icon(Icons.person, color: Colors.grey[700]),
      ),
    );
  }
}
