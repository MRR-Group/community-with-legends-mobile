import 'package:flutter/material.dart';
import '../../../../../config/colors.dart';

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
          message,
          style: TextStyle(fontSize: 10),
        ),
        Spacer(),
        TextButton(
          onPressed: onPress,
          child: Column(
            children: [
              Text(
                linkText,
                style: TextStyle(color: primaryColor, fontSize: 10),
              ),
              Text(
                actionText,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
