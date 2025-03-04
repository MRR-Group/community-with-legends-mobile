import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Color(0xFFB9B9BA)),
      obscureText: true,
      decoration: const InputDecoration(
        constraints: BoxConstraints(maxHeight: 40),
        contentPadding: EdgeInsets.all(12),
        hintText: 'Password',
        fillColor: Color(0xFF212023),
        filled: true,
        label: Text(
          "Enter your password",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
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
