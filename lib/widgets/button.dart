import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.text, this.fontSize, required this.onPressed});

  final String text;
  final double? fontSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
          backgroundColor: Colors.transparent
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 0.5, 1.0],
            colors: [Color(0xFF9C44FF), Color(0xFF8418FF), Color(0xFF8E2CFE)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 28),
          child: Text(text,
              style: TextStyle(color: Colors.white, fontSize: fontSize ?? 18)),
        ),
      ),
    );
  }
}
