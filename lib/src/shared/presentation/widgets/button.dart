import 'package:community_with_legends_mobile/config/colors.dart';
import 'package:community_with_legends_mobile/src/shared/presentation/widgets/loading_animation.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      this.fontSize,
      required this.onPressed,
      this.isLoading = false,});

  final String text;
  final double? fontSize;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.transparent,),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: primaryGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 28),
          child: isLoading
              ? const LoadingAnimation(
                  height: 26,
                  width: 43.6,
                )
              : Text(text,
                  style:
                      TextStyle(fontSize: fontSize ?? 18),),
        ),
      ),
    );
  }
}
