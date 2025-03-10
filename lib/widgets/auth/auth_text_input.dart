import 'package:flutter/material.dart';

class AuthTextInput extends StatelessWidget {
  const AuthTextInput(
      {super.key,
        required this.hint,
        required this.text,
        this.obscureText = false,
        required this.controller});

  final String hint;
  final String text;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Spacer()
          ],
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          style: TextStyle(color: Color(0xFFB9B9BA)),
          obscureText: obscureText,
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 40, minHeight: 40),
            errorStyle: TextStyle(

            ),
            contentPadding: const EdgeInsets.all(12),
            hintText: hint,
            fillColor: const Color(0xFF212023),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    );
  }
}