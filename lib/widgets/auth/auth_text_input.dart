import 'package:flutter/material.dart';

class AuthTextInput extends StatelessWidget {
  const AuthTextInput({super.key, required this.hint, required this.text, this.obscureText = false});

  final String hint;
  final String text;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Color(0xFFB9B9BA)),
      obscureText: obscureText,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 40),
        contentPadding: const EdgeInsets.all(12),
        hintText: hint,
        fillColor: const Color(0xFF212023),
        filled: true,
        label: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
