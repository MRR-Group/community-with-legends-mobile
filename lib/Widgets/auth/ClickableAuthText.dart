import 'package:flutter/material.dart';

class ClickableAuthText extends StatelessWidget {
  const ClickableAuthText({super.key, required this.message, required this.linkText, required this.actionText, required this.onPress});
  final String message;
  final String linkText;
  final String actionText;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "You don't have account?",
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
        Spacer(),
        TextButton(
          onPressed: onPress,
          child: Column(
            children: [
              Text(
                "Click here",
                style: TextStyle(color: Colors.purple, fontSize: 10),
              ),
              Text(
                "to register",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
