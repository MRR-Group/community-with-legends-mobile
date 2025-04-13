import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    required this.text,
    this.fontSize = 18,
    required this.onPressed,
    this.isSelected = false,
  });

  final String text;
  final double? fontSize;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Button(text: text, fontSize: fontSize, onPressed: onPressed)
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: primaryColor, width: 2),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: backgroundColor,
              foregroundColor: textDisabledColor,
              visualDensity: VisualDensity.compact,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 28),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
            ),
          );
  }
}
