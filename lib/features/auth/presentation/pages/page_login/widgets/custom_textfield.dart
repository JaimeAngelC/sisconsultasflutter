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
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.tealAccent),
      borderRadius: BorderRadius.circular(10),
    );
    return TextFormField(
      controller: controller,      
      validator: validator,
      decoration: InputDecoration(        
        fillColor: Colors.white,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: EdgeInsets.symmetric(vertical: 18),
        prefix: Icon(Icons.person, color: Colors.tealAccent),
      ),
    );
  }
}
