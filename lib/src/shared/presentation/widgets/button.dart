import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/loading_animation.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.verticalPadding = 4,
    this.horizontalPadding = 28,
    this.fontSize,
    this.isLoading = false,
    this.icon,
    this.iconRight = false,
    this.gradient = primaryGradient,
  });

  const Button.iconLeft({
    super.key,
    required this.text,
    required this.onPressed,
    this.verticalPadding = 4,
    this.horizontalPadding = 28,
    this.fontSize,
    this.isLoading = false,
    required this.icon,
    this.gradient = primaryGradient,
  }) : iconRight = false;

  const Button.iconRight({
    super.key,
    required this.text,
    required this.onPressed,
    this.verticalPadding = 4,
    this.horizontalPadding = 28,
    this.fontSize,
    this.isLoading = false,
    required this.icon,
    this.gradient = primaryGradient,
  }) : iconRight = true;

  final String text;
  final double? fontSize;
  final double verticalPadding;
  final double horizontalPadding;
  final VoidCallback onPressed;
  final bool isLoading;
  final Widget? icon;
  final bool iconRight;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: gradient,
        ),
        child: isLoading
            ? Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding,
                  horizontal: horizontalPadding,
                ),
                child: const LoadingAnimation(
                  height: 26,
                  width: 43.6,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalPadding,
                  horizontal: horizontalPadding,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null && !iconRight) ...[
                      icon!,
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                    Text(
                      text,
                      style: TextStyle(fontSize: fontSize ?? 18),
                      textAlign: TextAlign.center,
                    ),
                    if (icon != null && iconRight) ...[
                      const SizedBox(
                        width: 8,
                      ),
                      icon!,
                    ],
                  ],
                ),
              ),
      ),
    );
  }
}
