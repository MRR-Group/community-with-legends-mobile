import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class AuthTextInput extends StatelessWidget {
  const AuthTextInput({
    super.key,
    required this.hint,
    required this.text,
    this.obscureText = false,
    required this.controller,
  });

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
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 40, minHeight: 40),
            errorStyle: const TextStyle(
              height: 0.01,
            ),
            contentPadding: const EdgeInsets.all(12),
            hintText: hint,
            fillColor: backgroundLightColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              Alert.of(context).show(text: 'Make sure you fill in all fields');
              return '';
            }
            return null;
          },
        ),
      ],
    );
  }
}
