import 'package:flutter/material.dart';


class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String label;
  final String hint;
  final FormFieldValidator<String>? validator;
  const AuthField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.validator
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText, // an ki tu nhap vao
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(24),
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(
              color: Colors.grey.shade200
          ),
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400
          ),

          // Border khi không được focus
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),

          // Border khi được focus
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFFF0B3F4), width: 3),
          ),

          filled: true,
          fillColor: Colors.grey.shade500.withOpacity(0.6)
        ),
        validator: validator
      ),
    );
  }
}
