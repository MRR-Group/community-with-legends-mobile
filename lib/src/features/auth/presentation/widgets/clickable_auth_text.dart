import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:flutter/material.dart';

class ClickableAuthText extends StatelessWidget {
  const ClickableAuthText({
    super.key,
    required this.message,
    required this.linkText,
    required this.actionText,
    required this.onPress,
  });
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
          style: const TextStyle(fontSize: 10),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPress,
          child: Column(
            children: [
              Text(
                linkText,
                style: const TextStyle(color: primaryColor, fontSize: 10),
              ),
              Text(
                actionText,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
