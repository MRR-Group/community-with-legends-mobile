import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:flutter/material.dart';

class ClickableAuthText extends StatelessWidget {
  final String message;
  final String linkText;
  final String actionText;
  final VoidCallback onPress;
  
  const ClickableAuthText({
    super.key,
    required this.message,
    required this.linkText,
    required this.actionText,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            message,
            style: const TextStyle(fontSize: 10),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onPress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
