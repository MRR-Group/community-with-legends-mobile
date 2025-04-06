import 'package:flutter/material.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 3,
          ),
          Image.asset(
            'assets/images/loading.gif',
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }
}
